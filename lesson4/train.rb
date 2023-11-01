class Train
  attr_accessor :speed
  attr_reader :id, :carriages, :route
  def initialize (id)
    @id = id
    @speed = 0
    @route = 0
    @carriages = []
  end

  def stop
    @speed = 0
  end

  def remove_carriage
    @carriages.delete_at(-1) if @speed.zero? && @carriages.length > 0
  end

  def route(route)
    if route.class == Route
      @location = 0
      @route = route
      @route.stations[@location].bring_train(self)
    end
  end

  def move (direction)
    if @route != 0 && direction == "forward" && @location < @route.stations.size
      @route.stations[@location].send_train(self)
      @location += 1
      @route.stations[@location].bring_train(self)
    elsif @route != 0 && direction == "back" && @location > 0
      @route.stations[@location].send_train(self)
      @location -= 1
      @route.stations[@location].bring_train(self)
    else
      puts "there is no route assigned to the train or there are no more station"
    end
  end

  def where (locate)
    puts "previous station is #{@route[@location - 1]}" if locate == "previous" && @route > 0
    puts "current station is #{@route[@location]}" if locate == "current"
    puts "next station is #{@route[@location + 1]}" if locate == "next" && @location < @route.size
  end
end
