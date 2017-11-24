require 'spec_helper'

RSpec.describe Maf::Env do
  subject { Maf::Env.new(env) }

  let(:env) do
    {
      'REQUEST_METHOD' => 'GET',
      'REQUEST_PATH' => '/foo',
      'QUERY_STRING' => 'bar=1&baz=2',
    }
  end


  [
    %w(method REQUEST_METHOD),
    %w(path REQUEST_PATH),
    %w(query QUERY_STRING),
  ].each do |method_name, header_key|
    describe "##{method_name}" do
      it "returns env['#{header_key}']" do
        expect(subject.send(method_name)).to eq env[header_key]
      end
    end
  end

  describe '#params' do
    it 'should be frozen' do
      expect(subject.params).to be_frozen
    end

    context 'GET' do
      context 'w/o query string' do
        let(:env) { super().merge({ 'QUERY_STRING' => '' }) }

        it 'should be empty' do
          expect(subject.params).to be_empty
        end
      end

      it 'parses query_params' do
        expected = {
          'bar' => '1',
          'baz' => '2',
        }
        expect(subject.params).to eq expected
      end
    end
  end
end
