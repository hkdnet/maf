require 'spec_helper'

require 'cgi'

RSpec.describe Maf::Env do
  subject { Maf::Env.new(Rack::Request.new(env)) }

  let(:env) do
    {
      'REQUEST_METHOD' => 'GET',
      'PATH_INFO' => '/foo',
      'QUERY_STRING' => 'bar=1&baz=2',
      'rack.input' => StringIO.new(body),
    }
  end
  let(:body) { '' }

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

    context 'POST' do
      let(:env) do
        super().merge({
          'REQUEST_METHOD' => 'POST',
          'CONTENT_TYPE' => 'application/x-www-form-urlencoded'
        })
      end

      context 'content type application/x-www-form-urlencoded' do
        let(:body) do
          text = "body_param1=1&body_param2=Quick brown fox"
          URI.encode(text)
        end

        it 'should be empty' do
          expected = {
            'body_param1' => "1",
            'body_param2' => "Quick brown fox",
          }
          expect(subject.params).to include expected
        end
      end

      it 'parses query_params' do
        expected = {
          'bar' => '1',
          'baz' => '2',
        }
        expect(subject.params).to include expected
      end
    end
  end
end
