class Train
  attr_accessor :train_speed
  attr_reader :train_lenght, :train_type, :train_id
  def initialize (id, type, number)
    @train_id = id
    @train_type = type
    @train_lenght = number
    @train_speed = 0
    @train_route = 0
  end

  def stop
    @train_speed = 0
  end

  def change_lenght (change)
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

  def set_a_route (route)
    @train_route = route
  end

  def where (locate)
    if @train_route != 0
      if locate == "previous"
        #
      elsif locate == "current"
        #
      elsif locate == "next"
        #
      else
        puts "Invalid entry/ Enter previous, current, or next"
      end
    else
      puts "There is no route for this train"
    end
