require_relative 'bike'

class DockingStation

  attr_reader :bike
  def release_bike
    fail 'No bikes available' unless @bike #adding a guard condition
    @bike
  end

  def dock(bike)
    fail 'Docking Station is full' if @bike
    @bike = bike
  end

end