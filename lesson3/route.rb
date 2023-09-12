require_relative 'station'

class Route
  attr_reader :first_station, :route_stations

  def initialize(first_station, last_station)
    @route_first = first_station
    @route_last = last_station
    @route_stations = [first_station, last_station]
  end

  def add_station (station)
    if station.class != Station || @route_stations.include?
      puts "The object is not a station class or alredy exist"
    else
      @route_stations << @route_stations[-1]
      @route_stations[-2] = station
    end
  end

  def delete_station (station)
    if @route_stations.include?
      @route_stations.delete(station)
    else
      puts "Invalid input"
    end
  end
end
