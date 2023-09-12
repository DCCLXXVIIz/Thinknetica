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
    @train_location = 0
  end

  def train_stop
    @train_speed = 0
  end

  def train_change_lenght (change)
    if @train_speed == 0
      if change == "add"
        @train_lenght += 1
      elsif change == "remove" && @train_lenght > 0
        @train_lenght -= 1
      else
        puts "the train has no wagon to remove or an invalid command has been entered. Enter add or remove to method"
      end
    else
      puts "the train is moving. To change the number of cars, stop the train"
    end
  end

  def train_route(route)
    if route.class == Route
      @train_route = route.route_stations

    else
      puts "Invalid input"
    end
  end

  def train_move (direction)
    if direction == "forward"
      @train_location += 1 if @train_location < @train_route.size
    elsif direction == "back"
      @train_location -= 1 if @train_location > 0
    else
      puts "invalid input. only forward and back are accepted"
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
