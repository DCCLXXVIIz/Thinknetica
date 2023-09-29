require_relative 'station'

class Route
  attr_reader :stations
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end
  def add_station (station)
    if station.class != Station || @stations.include?(station)
      puts "The object #{station} is not a station class or alredy exist in route"
    else
      @stations.insert(-2, station)
      puts "#{station.station_name} station has been added to the route (#{@stations[0].station_name} --- #{@stations[-1].station_name})"
    end
  end
  def delete_station (station)
    @stations.delete(station) if @stations.include?(station)
  end
  def stations_name
    @stations.each {|index| puts index.station_name}
  end
end
