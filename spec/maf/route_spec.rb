require 'spec_helper'

RSpec.describe Maf::Route do
  describe '#match?' do
    context 'w/o param' do
      subject { Maf::Route.new('get', '/path', nil) }

      it { expect(subject.match?('get', '/path')).to eq true }
      it { expect(subject.match?('get', '/path/foo')).to eq false }
    end
  end

  describe '#call' do
    subject { Maf::Route.new('get', '/path', resolver) }

    let(:env) { Hash.new }
    let(:resolver) { -> { } }
    let(:renderer) { instance_double('Maf::Renderer') }

    it 'delegates to renderer.render' do
      allow(renderer).to receive(:render)
      allow(subject).to receive(:create_renderer).and_return(renderer)

      subject.call(env)
      expect(renderer).to have_received(:render).with(resolver)
    end

    it 'uses a renderer from create_renderer' do
      allow(renderer).to receive(:render)
      allow(subject).to receive(:create_renderer).and_return(renderer)

      subject.call(env)
      expect(subject).to have_received(:create_renderer).with(env)
    end
  end
end
