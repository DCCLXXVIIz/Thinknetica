class Train
  attr_reader :name, :carriages, :route

  def initialize (id)
    @name = id
    @speed = 0
    @carriages = []
    @route = 0
  end

  def move_forward
      next_station if route_exist? && not_last_station
  end

  def move_back
    previous_station if route_exist? && not_first_station
  end

  def route(route)
    assign_route(route)
  end

  def add_carriage(carriage)
    dock_carriage(carriage) if train_stoped? && type_check(carriage)
  end

  def remove_carriage
    undock_carriage if train_stoped? && has_carriages?
  end

  def carriages_list
    list_carriage
  end

  def where (locate)
    if locate == "previous" && route_exist? && not_first_station
      list_previous
    elsif locate == "current" && route_exist?
      list_current
    elsif locate == "next" && route_exist? && not_last_station
      list_next
    else
      print "There is no route assigned to the train of wrong request. Enter previous|current|next"
    end
  end

  protected
  def assign_route(route)
    @location = 0
    @route = route
    @stations = route.stations
    @stations[@location].bring_train(self)
    successfully
  end

  #def stop
    #@speed = 0
  #end

  def train_stoped?
    @speed.zero?
  end

  def type_check(carriage)
    carriage.type == @type
  end
  
  def dock_carriage(carriage)
    @carriages << carriage
    successfully
  end

  def has_carriages?
    @carriages.length > 0
  end

  def undock_carriage
    @carriages.delete_at(-1)
    successfully
  end

  def route_exist?
    true if @route != 0
  end

  def next_station
    @route.stations[@location].send_train(self)
    @location += 1
    @route.stations[@location].bring_train(self)
    successfully
  end

  def not_last_station
    @location < @stations.size
  end

  def previous_station
    @route.stations[@location].send_train(self)
    @location -= 1
    @route.stations[@location].bring_train(self)
    successfully
  end

  def not_first_station
    @location > 0
  end

  def list_carriage
    @carriages.each{|index| puts "#{index.name}"}
  end

  def list_previous
    puts "previous station is #{@route[@location - 1]}"
  end

  def list_current
    puts "current station is #{@route[@location]}"
  end

  def list_next
    puts "next station is #{@route[@location + 1]}"
  end

  def successfully
    print "Complited \n"
  end
end
