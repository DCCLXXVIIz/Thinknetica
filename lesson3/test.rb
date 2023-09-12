require_relative 'station'
require_relative 'route'
require_relative 'train'

train1 = Train.new(1, "cargo", 2)
train2 = Train.new(2, "passanger", 1)
train3 = Train.new(3, "cargo", 3)
train4 = Train.new(4, "passanger", 1)
train5 = Train.new(5, "passanger", 2)

puts train5.train_type
