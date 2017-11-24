require 'spec_helper'

RSpec.describe Maf::Route do
  describe '#match?' do
    context 'w/o param' do
      subject { Maf::Route.new('get', '/path', nil) }

      it { expect(subject.match?('get', '/path')).to eq true }
      it { expect(subject.match?('get', '/path/foo')).to eq false }
    end
  end
end
