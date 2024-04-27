require_relative './debugger'

class Route
  include Debugger
  include InstanceCounter
  attr_reader :stations, :name

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @name = "#{first_station.name}-#{last_station.name}"
    register_instance
  end

  def add_station(station)
    if right_object?(station, Station) == false || already_in_route(station)
      error_message
    else
      insert_station(station)
    end
  end

  def delete_station(station)
    remove_station(station) if already_in_route(station)
  end

  protected
  def error_message
    puts "The object #{station} is not a station class or alredy exist in route"
  end

  def insert_station (station)
      @stations.insert(-2, station)
      puts "#{station.name} station has been added to the route (#{@stations[0].name} --- #{@stations[-1].name})"
  end

  def remove_station (station)
    @stations.delete(station)
  end

  def already_in_route(station)
    @stations.include?(station)
  end

  def stations_name
    @stations.each {|index| puts index.station_name}
  end

  def right_object?(object, object_class)
    object.class == object_class
  end
end
