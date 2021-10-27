require 'bike'

describe Bike do
  subject(:bike) { described_class.new }

  describe 'working' do
    it { is_expected.to respond_to :working? }
  end

  describe 'report_broken' do

    it { is_expected.to respond_to :broken? }

    it 'will allow bike to be reported as broken' do
      bike.report_broken
      # let's use one of RSpec's predicate matchers
      expect(bike).to be_broken
    end
  end
end


