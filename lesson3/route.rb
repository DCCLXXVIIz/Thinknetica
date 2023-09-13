require_relative 'station'

class Route
  attr_reader :first_station, :route_stations

  def initialize(first_station, last_station)
    @route_first = first_station
    @route_last = last_station
    @route_stations = [first_station, last_station]
  end

  def route_add_station (station)
    if station.class != Station || @route_stations.include?(station)
      puts "The object #{station} is not a station class or alredy exist in route"
    else
      @route_stations << @route_stations[-1]
      @route_stations[-2] = station
      puts "#{station.station_name} station has been added to the route (#{@route_stations[0].station_name} --- #{@route_stations[-1].station_name})"
    end
  end

  def route_delete_station (station)
    if @route_stations.include?(station)
      @route_stations.delete(station)
      puts "#{station.station_name} station was removed from the route (#{@route_stations[0].station_name} --- #{@route_stations[-1].station_name})"
    else
      puts "Invalid input"
    end
  end

  def route_stations_name
    @route_stations.each {|index| puts index.station_name}
  end
end
