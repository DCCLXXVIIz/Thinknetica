require_relative 'route'

class Train
  attr_accessor :t_speed
  attr_reader :t_lenght, :t_type, :t_id
  def initialize (id, type, number)
    @t_id = id
    @t_type = type
    @t_lenght = number
    @t_speed = 0
    @t_route = 0
  end

  def t_stop
    @t_speed = 0
  end

  def t_change (change)
    @t_lenght += 1 if @t_speed == 0 && change == "add"
    @t_lenght -= 1 if @t_speed == 0 && change == "remove" && @t_lenght > 0
  end

  def t_route(route)
    if route.class == Route
      @t_location = 0
      @t_route = route
      @t_route.r_stations[@t_location].s_bring_train(self)
    end
  end

  def t_move (direction)
    if @t_route != 0 && direction == "forward" && @t_location < @t_route.r_stations.size
      @t_route.r_stations[@t_location].s_send_train(self)
      @t_location += 1
      @t_route.r_stations[@t_location].s_bring_train(self)
    elsif @t_route != 0 && direction == "back" && @t_location > 0
      @t_route.r_stations[@t_location].s_send_train(self)
      @t_location -= 1
      @t_route.r_stations[@t_location].s_bring_train(self)
    else
      puts "there is no route assigned to the train or there are no more station"
    end
  end

  def t_where (locate)
    puts "previous station is #{@t_route[@t_location - 1]}" if locate == "previous" && @t_route > 0
    puts "current station is #{@t_route[@t_location]}" if locate == "current"
    puts "next station is #{@t_route[@t_location + 1]}" if locate == "next" && @t_location < @t_route.size
  end
end
