require_relative './debugger'

class Station
  include Debugger
  include InstanceCounter
  attr_reader :trains, :name, :stations
  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    register_instance
  end

  def self.all
    @@stations
  end

  def self.new_station(station)
    self.add(station)
  end

  def bring_train(train)
    add_train(train)
  end

  def send_train(train)
    remove_train(train) if train_at_station?(train)
  end

  def train_list
    list_of_trains
  end

  protected
  def add_train (train)
    @trains << train
  end

  def remove_train (train)
    @trains.delete(train)
  end

  def list_of_trains
    @trains.each {|index| puts index.name}
  end

  def train_at_station?(train)
    @trains.include?(train)
  end

  def self.add(station)
    @@stations << station
  end
end
