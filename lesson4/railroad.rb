require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'cargo_carriage'
require_relative 'passenger_train'
require_relative 'passenger_carriage'

class Railroad

  def initialize
    @stations = {}
    @trains = {}
    @routes = {}
    @route = 1
  end

  def menu(number)
    case number
      when 1
        self.create_station
      when 2
        self.create_train
      when 3
        self.manage_route
      when 4
        self.assign_route
      when 5
        self.add_carriages
      when 6
        self.detach_carriages
      when 7
        self.move_train
      when 8
        self.viev_list
    end
  end

  private
  def create_station
    puts "Enter the station name"
    name = gets.chomp
    @stations[name] = Station.new(name)
  end

  def create_train
    puts "Enter the train id"
    id = gets.to_i
    puts "1 - Cargo train; 2 - Passanger train"
    choose = gets.to_i
    case choose
      when 1
        @trains[id] = CargoTrain.new(id)
      when 2
        @trains[id] = PassengerTrain.new(id)
      end
  end

  def manage_route
    puts "Enter a value between 1 and 3 in the field: \n
    1. Create a route \n
    2. Add a station to the route \n
    3. Remove a station from the route \n"
    number = gets.to_i
    case number
      when 1
        self.create_route
      when 2
        self.add_station
      when 3
        self.delete_station
    end
  end

  def create_route
    puts "Enter the name of the first and last station of the route"
    @routes[@route] = Route.new(@stations[select_station], @stations[select_station])
    @route += 1
  end

  def add_station
    @routes[select_route].add_station(@stations[select_station])
  end

  def delete_station
    @routes[select_route].delete_station(@stations[select_station])
  end

  def assign_route
    @trains[select_train].route(@routes[select_route])
  end

  def add_carriages
    @trains[select_train].add_carriage
  end

  def detach_carriages
    @trains[select_train].remove_carriage
  end

  def move_train
    puts "1 - Forward, 2 - Back"
    number = gets.to_i
    case
      when 1
        @trains[select_train].move("forward")
      when 2
        @trains[select_train].move("back")
    end
  end

  def viev_list
    @stations[select_station].train_list
  end



  def select_route
    puts "Select the route from"
    self.route_list
    route = gets.to_i
  end

  def select_station
    puts "Select station from"
    self.station_list
    station = gets.chomp
  end

  def select_train
    puts "Select the train from"
    self.train_list
    train = gets.to_i
    @trains[train].where("current")
  end

  def route_list
    puts "route list"
    @routes.keys.each {|index| puts index}
  end

  def station_list
    puts "station list"
    @stations.keys.each {|index| puts index}
  end

  def train_list
    puts "train list"
    @trains.keys.each {|index| puts index}
  end
end
