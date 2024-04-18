require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'passenger_train'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'


class Railroad
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @carriages = []
  end

  def menu(number)
    case number
      when 1
        create_station
      when 2
        create_train
      when 3
        manage_route
      when 4
        assign_route
      when 5
        manage_carriage
      when 6
        #detach_carriages
        move_train
      when 7
        viev_list
    end
  end

  private
  def create_station
    puts "Enter the station name"
    @stations << Station.new(gets.chomp)
    successfully
  end

  def create_train
    puts "1 - Cargo train; 2 - Passanger train"
    case gets.to_i
      when 1
        @trains << CargoTrain.new(id)
        successfully
      when 2
        @trains << PassengerTrain.new(id)
        successfully
      end
  end

  def id
    puts "Enter the object id"
    gets.to_i
  end

  def successfully
    puts "Completed successfully"
  end


  def manage_route
    puts "Enter a value between 1 and 3 in the field: \n
    1. Create a route \n
    2. Add a station to the route \n
    3. Remove a station from the route \n"
    case gets.to_i
      when 1
        create_route
      when 2
        add_station
      when 3
        delete_station
    end
  end

  def create_route
    puts "Enter the name of the first and last station of the route"
    @routes << Route.new(selected_station, selected_station)
  end

  def add_station
    selected_route.add_station(selected_station)
  end

  def delete_station
    route = selected_route
    route.delete_station(selected_route_stations(route))
  end

  def selected_route_stations(route)
    list(route.stations)
    route.stations[gets.to_i]
  end

  def assign_route
    selected_train.route(selected_route)
  end

  def manage_carriage
    puts "Enter a value between 1 and 2 in the field: \n
    1. Create a carriage \n
    2. Add a carriage to the train \n
    3. Remove a carriage from train"
    case gets.to_i
      when 1
        create_carriage
      when 2
        add_carriages
      when 3
        detach_carriages
    end
  end

  def create_carriage
    puts "Enter a value between 1 and 2 in the field: \n
    1. Create a cargo carriage \n
    2. Create a passanger carriage \n"
    case gets.to_i
      when 1
        @carriages << CargoCarriage.new(id)
        successfully
      when 2
        @carriages << PassengerCarriage.new(id)
        successfully
    end
  end

  def add_carriages
    selected_train.add_carriage(selected_carriage)
  end

  def detach_carriages
    selected_train.remove_carriage
  end

  def move_train
    puts "1 - Forward, 2 - Back"
    case gets.to_i
      when 1
        selected_train.move_forward
      when 2
        selected_train.move_back
    end
  end

  def viev_list
    puts "What do you want to list? Type... \n
      1. View a train list on station \n
      2. View a carriage list of train"
    case gets.to_i
      when 1
        selected_station.train_list
      when 2
        selected_train.carriages_list
    end
  end

  def selected_route
    list(@routes, "route")
    @routes[gets.to_i]
  end

  def selected_station
    list(@stations, "station")
    @stations[gets.to_i]
  end

  def selected_train
    list(@trains, "train")
    @trains[gets.to_i]
  end

  def selected_carriage
    list(@carriages, "carriage")
    @carriages[gets.to_i]
  end

  def list(object, name = "object")
    puts "Select the #{name} from objects list"
    object.each_index {|index| puts "To select the #{name} #{object[index].name} dial at the terminal #{index}"}
  end
end
