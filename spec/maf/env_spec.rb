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
end
