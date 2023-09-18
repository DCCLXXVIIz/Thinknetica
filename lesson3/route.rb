require_relative 'station'

class Route
  attr_reader :r_stations
  def initialize(first_station, last_station)
    @r_stations = [first_station, last_station]
  end
  def r_add_station (station)
    if station.class != Station || @r_stations.include?(station)
      puts "The object #{station} is not a station class or alredy exist in route"
    else
      @r_stations.include(-2, station)
      puts "#{station.station_name} station has been added to the route (#{@r_stations[0].station_name} --- #{@r_stations[-1].station_name})"
    end
  end
  def route_delete_station (station)
    @r_stations.delete(station) if @r_stations.include?(station)
  end
  def route_stations_name
    @r_stations.each {|index| puts index.station_name}
  end
end
