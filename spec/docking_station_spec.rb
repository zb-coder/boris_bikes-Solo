require 'docking_station'

describe DockingStation do

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
      subject.dock Bike.new
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'raises error when the docking_station is at full capacity' do
      subject.capacity.times{ subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking Station is full'
    end
  
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    describe 'releae_bike' do
      it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end   
    end

    # describe 'dock' do
    #   it 'does not release broken bikes' do
    #     bike = Bike.new
    #     bike.report_broken
    #     subject.dock bike
    #     expect{subject.release_bike}.to raise_error 'No bikes available'
    #   end
    # end
  

  # it { is_expected.to respond_to(:bike) }

  # it 'docks something' do
  #   bike = Bike.new
  #   expect(subject.dock(bike)).to eq bike
  # end
  
  # it 'returns docked bikes' do
  #   bike = Bike.new
  #   subject.dock(bike)
  #   expect(subject.bike).to eq bike #after we've docked the bike, we need to return the bike we just docked
  # end
end
