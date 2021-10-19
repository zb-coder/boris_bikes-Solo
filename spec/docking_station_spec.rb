require 'docking_station'

describe DockingStation do
  it 'responds to release bike' do
    expect(subject).to respond_to :release_bike
  end
  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

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

  it 'raises error when the docking_station is at full capacity' do

    DockingStation::DEFAULT_CAPACITY.times do
    subject.dock Bike.new
    end
  end
end