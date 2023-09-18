require_relative 'route'

class Train
  attr_accessor :train_speed
  attr_reader :train_lenght, :train_type, :train_id
  def initialize (id, type, number)
    @train_id = id
    @train_type = type
    @train_lenght = number
    @train_speed = 0
    @train_route1 = 0
    @train_location = 0
  end
  def train_stop
    @train_speed = 0
  end
  def train_change_lenght (change)
    @train_lenght += 1 if @train_speed == 0 && change == "add"
    @train_lenght -= 1 if @train_speed == 0 && change == "remove" && @train_lenght > 0
  end
  def train_route(route, self)
    if route.class == Route
      @train_route1 = route
      @train_route1.route_stations[0].station_bring_train(self)
  end
  def train_move (direction, self)
    if @train_route1 != 0 && direction == "forward"
        @train_location += 1 if @train_location < @train_route1.route_stations.size
        @train_route1.route_stations[@train_location-1].station_send_train(train)
        @train_route1.route_stations[@train_location].station_bring_train(train)
    elsif @train_route1 != 0 && direction == "back"
        @train_location -= 1 if @train_location > 0
        @train_route1.route_stations[@train_location+1].station_send_train(train)
        @train_route1.route_stations[@train_location].station_bring_train(train)
  end
  def train_where (locate)
    puts "previous station is #{@train_route[@train_location - 1]}" if @train_route.size != 0 && locate == "previous"
    puts "current station is #{@train_route[@train_location]}" if @train_route.size != 0 && locate == "current"
    puts "next station is #{@train_route[@train_location + 1]}" if @train_route.size != 0 && locate == "next" && @train_location < @train_route1.route_stations.size
  end
end
