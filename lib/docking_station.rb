require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
  
  def release_bike
    raise 'No bikes available' if empty? 
    raise 'Bike is Broken' if bikes.last.broken? == true
    
    bikes.pop
  end

  def dock(bike)
    fail 'Docking Station is full' if full? 
    bikes << bike
  end

  private
  
  attr_reader :bikes
  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty? 
  end

end