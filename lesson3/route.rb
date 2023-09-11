class Route
  attr_reader :first_station
  def initialize(first_station, last_station)
    @route_first = first_station
    @route_last = last_station
    @route_stations = [first_station, last_station]
  end

  def add (station)
    if station.class = Station && @route_stations.include?
      @route_stations << @route_stations[-1]
      @route_stations[-2] = station
    else
      puts "The object is not a station class"
    end
