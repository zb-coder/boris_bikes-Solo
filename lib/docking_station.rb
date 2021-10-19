require_relative 'bike'

class DockingStation

  def initialize
    @bikes = []
  end
  
  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking Station is full' if full?
    @bikes << bike
  end

  private
  
  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty? 
  end
end