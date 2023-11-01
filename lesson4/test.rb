require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'cargo_carriage'
require_relative 'passenger_train'
require_relative 'passenger_carriage'

train1 = CargoTrain.new(1)
train2 = CargoTrain.new(2)
train3 = CargoTrain.new(3)
train4 = PassengerTrain.new(4)
train5 = PassengerTrain.new(5)

station1 = Station.new("Moscow")
station2 = Station.new("Gagarin")
station3 = Station.new("Vyazma")
station4 = Station.new("Smolensk")
station5 = Station.new("Orsha-Center")
station6 = Station.new("Minsk")
station7 = Station.new("Molodechno")
station8 = Station.new("Smorgon")
station9 = Station.new("Kaliningrad")

cargo_carriage1 = CargoCarriage
cargo_carriage2 = CargoCarriage
cargo_carriage3 = CargoCarriage
passenger_carriage1 = PassengerCarriage
passenger_carriage2 = PassengerCarriage
passenger_carriage3 = PassengerCarriage
passenger_carriage4 = PassengerCarriage
passenger_carriage5 = PassengerCarriage

route1 = Route.new(station1, station9)
route2 = Route.new(station6, station9)
route3 = Route.new(station9, station1)
route4 = Route.new(station9, station6)
route1.add_station(station2)
route1.add_station(station3)
route1.add_station(station4)
route1.add_station(station5)
route1.add_station(station6)
route1.add_station(station7)
route1.add_station(station8)
route1.add_station(station6)
route1.delete_station(station4)

route2.add_station(station7)
route2.add_station(station8)

route1.stations_name

train1.speed = 40
train1.add_carriage(cargo_carriage1)
train1.add_carriage(cargo_carriage2)
train1.stop
train1.add_carriage(cargo_carriage1)
train1.add_carriage(cargo_carriage2)
#train1.remove_carriage(cargo_carriage1)
train1.add_carriage(cargo_carriage3)
train4.add_carriage(passenger_carriage1)
train4.add_carriage(passenger_carriage2)

station1.train_list
train1.move("forward")
train1.route(route1)
train2.route(route1)
train4.route(route1)
station1.train_list
train1.move("forward")
station1.train_list
station2.train_list
train2.move("back")
puts train1.carriages
puts train4.carriages
