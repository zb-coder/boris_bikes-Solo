require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }
  # describe 'initialization' do
  #   subject { DockingStation.new }
  #   let (:bike) { Bike.new }
  #   it 'defaults capacity' do
  #     described_class::DEFAULT_CAPACITY.times
  #     subject.dock(bike)
  #   end
  #   expect{ subject.dock(bike) }.to raise_error 'Docking Station is full'
  # end

  it 'responds to release bike' do
    expect(subject).to respond_to :release_bike
  end

  # describe '#release_bike' do
  #   it 'releases a bike' do
  #     bike = Bike.new
  #     subject.dock(bike)
  #     expect(subject.release_bike).to eq bike
  #   end
    it 'releases working bikes' do 
     bike = double(:bike, broken?: false)
     subject.dock bike
     expect(subject.release_bike).to be bike
    end

    it 'does not release broken bikes' do
      bike = double(:bike)
      allow(bike).to receive(:broken?).and_return(true)
      subject.dock bike
      expect {subject.release_bike}.to raise_error 'Bike is Broken'
    end

    # this is the same as the test above
    # it 'does not release broken bikes' do
    #   # see how we move the allow() statement
    #   # into the double creation statement
    #   bike = double(:bike, broken?: true)
    #   subject.dock bike
    #   expect {subject.release_bike}.to raise_error 'No bikes available'
    # end

    describe 'release_bike' do
      it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end   

    describe 'dock' do
      it { is_expected.to respond_to(:dock).with(1).argument }

      it 'has a default capacity' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end

      it 'raises error when the docking_station is at full capacity' do
        subject.capacity.times{ subject.dock double :bike }
        expect { subject.dock double(:bike) }.to raise_error 'Docking Station is full'
      end
    end
  end
end