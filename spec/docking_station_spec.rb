require 'docking_station'

describe DockingStation do
  it 'responds to release bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'releases working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  
end