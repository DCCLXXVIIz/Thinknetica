require_relative './station'
require_relative './route'
require_relative './train'
require_relative './cargo_train'
require_relative './carriage'
require_relative './passenger_train'
require_relative './cargo_carriage'
require_relative './passenger_carriage'
require_relative './vendor'
require_relative './debugger'
require_relative './instance_counter'

class Railroad
  include Debugger
  include InstanceCounter
  def initialize
    #@stations = []
    #@trains = []
    @routes = []
    @carriages = []
  end

  def menu(number)
    case number
    when 1
      create_station
    when 2
      manage_train
    when 3
      manage_route
    when 4
      assign_route
    when 5
      manage_carriage
    when 6
      move_train
    when 7
      viev_list
    end
  end

  private
  def create_station
    puts "Enter the station name"
    #@stations << Station.new(gets.chomp)
    Station.new_station(Station.new(gets.chomp))
    successfully
    
  end

  def manage_train
    puts "Enter a value between 1 and 3 in the field: \n
    1. Create a train \n
    2. Add a vendor info \n"
    case gets.to_i
    when 1
      create_train
    when 2
      add_vendor(selected_train)
    end
  end

  def create_train
    puts "1 - Cargo train; 2 - Passanger train"
    case gets.to_i
    when 1
      Train.add(CargoTrain.new(id))
      successfully
    when 2
      Train.add(PassengerTrain.new(id))
      successfully
    end
  end

  def add_vendor(object)
    puts "Type the vendor's name"
    object.set_vendor(gets)
  end

  def id
    puts "Enter the object id"
    gets.chomp
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
      2. View a carriage list of train \n
      3. Search \n
      4. Get instances"
    case gets.to_i
    when 1
      selected_station.train_list
    when 2
      selected_train.carriages_list
    when 3
      print Train.find(id)
    when 4
      get_instances
    end
  end

  def selected_route
    list(@routes, "route")
    @routes[gets.to_i]
  end

  def selected_station
    list(Station.all, "station")
    Station.all[gets.to_i]
  end

  def selected_train
    list(Train.all, "train")
    Train.all[gets.to_i]
  end

  def selected_carriage
    list(@carriages, "carriage")
    @carriages[gets.to_i]
  end

  def list(object, name = "object")
    puts "Select the #{name} from objects list"
    object.each_index {|index| puts "To select the #{name} #{object[index].name} dial at the terminal #{index}"}
  end

  def get_instances
    puts "What instance do you want to list? Type... \n
      1. View a trains instances \n
      2. View a stations instances \n
      3. View a routes instances"
    case gets.to_i
    when 1
      puts "Number of objects is equal to #{Train.instances}"
    when 2
      puts "Number of objects is equal to #{Station.instances}"
    when 3
      puts "Number of objects is equal to #{Route.instances}"
    end
  end
end
