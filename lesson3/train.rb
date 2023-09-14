require_relative 'route'

class Train
  attr_accessor :train_speed
  attr_writer :train_route
  attr_reader :train_lenght, :train_type, :train_id
  def initialize (id, type, number)
    @train_id = id
    @train_type = type
    @train_lenght = number
    @train_speed = 0
    @train_route = []
    @train_route1 = 0
    @train_location = 0
  end

  def train_stop
    @train_speed = 0
  end

  def train_change_lenght (change)
    if @train_speed == 0
      if change == "add"
        @train_lenght += 1
        puts "A wagon has been added to the train. The number of wagon is now #{@train_lenght}"
      elsif change == "remove" && @train_lenght > 0
        @train_lenght -= 1
        puts "A wagon has been removed to the train. The number of wagon is now #{@train_lenght}"
      else
        puts "the train has no wagon to remove or an invalid command has been entered. Enter add or remove to method"
      end
    else
      puts "the train is moving at speed #{@train_speed}. To change the number of wagon, stop the train"
    end
  end

  def train_route(route,train)
    if route.class == Route && train.class == Train
      #@train_route = route.route_stations
      @train_route1 = route
      @train_route1.route_stations[0].station_bring_train(train)
    else
      puts "Invalid input"
    end
  end

  def train_move (direction, train)
    if @train_route1 != 0 && train.class == Train
      if direction == "forward"
        @train_location += 1 if @train_location < @train_route1.route_stations.size
        @train_route1.route_stations[@train_location-1].station_send_train(train)
        @train_route1.route_stations[@train_location].station_bring_train(train)
      elsif direction == "back"
        @train_location -= 1 if @train_location > 0
        @train_route1.route_stations[@train_location+1].station_send_train(train)
        @train_route1.route_stations[@train_location].station_bring_train(train)
      else
        puts "invalid input. only forward and back are accepted"
      end
    else
      puts "there is no route assigned to the train"
    end
  end



  def train_where (locate)
    if @train_route.size != 0
      if locate == "previous"
        puts "previous station is #{@train_route[@train_location - 1]}" if @train_route > 0
      elsif locate == "current"
        puts "current station is #{@train_route[@train_location]}"
      elsif locate == "next"
        puts "next station is #{@train_route[@train_location + 1]}" if @train_location < @train_route.size
      else
        puts "Invalid entry/ Enter previous, current, or next"
      end
    else
      puts "There is no route for this train yet"
    end
  end
end
