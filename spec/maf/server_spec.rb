require 'spec_helper'

RSpec.describe Maf::Server do
  let(:server) { Maf::Server.new(config) }
  let(:config) { Maf::Config.new }

  describe 'call' do
    subject { server.call(env) }

    let(:env) do
      {
        'REQUEST_PATH' => '/foo',
        'REQUEST_METHOD' => 'GET',
      }
    end
    let(:handler) do
      -> {
        text('test')
      }
    end
    let(:config) do
      super().tap do |e|
        e.routes << Maf::Route.new('GET', '/foo', handler)
      end
    end

    it do
      expect(subject[0]).to eq 200
      expect(subject[1]).to include({ 'Content-Type' => 'text/plain' })
      expect(subject[2]).to include 'test'
    end
  end
end
