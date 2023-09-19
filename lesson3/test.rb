require_relative 'station'
require_relative 'route'
require_relative 'train'

train1 = Train.new(1, "cargo", 2)
train2 = Train.new(2, "passanger", 1)
train3 = Train.new(3, "cargo", 3)
train4 = Train.new(4, "passanger", 1)
train5 = Train.new(5, "passanger", 2)

station1 = Station.new("Moscow")
station2 = Station.new("Gagarin")
station3 = Station.new("Vyazma")
station4 = Station.new("Smolensk")
station5 = Station.new("Orsha-Center")
station6 = Station.new("Minsk")
station7 = Station.new("Molodechno")
station8 = Station.new("Smorgon")
station9 = Station.new("Kaliningrad")

route1 = Route.new(station1, station9)
route2 = Route.new(station6, station9)
route3 = Route.new(station9, station1)
route4 = Route.new(station9, station6)
route1.r_add_station(station2)
route1.r_add_station(station3)
route1.r_add_station(station4)
route1.r_add_station(station5)
route1.r_add_station(station6)
route1.r_add_station(station7)
route1.r_add_station(station8)
route1.r_add_station(station6)
route1.r_delete_station(station4)

route2.r_add_station(station7)
route2.r_add_station(station8)

route1.r_stations_name

train1.t_speed = 40
train1.t_change("add")
train1.t_change("remove")
train1.t_stop
train1.t_change("add")
train1.t_change("remove")
train1.t_change("remove")
train1.t_change("remove")
train1.t_change("remove")
train1.t_change("remove")

station1.s_train_list
train1.t_move("forward")
train1.t_route(route1)
train2.t_route(route1)
train3.t_route(route1)
station1.s_train_list
train1.t_move("forward")
station1.s_train_list
station2.s_train_list
train2.t_move("back")
station1.s_trains_type_list
