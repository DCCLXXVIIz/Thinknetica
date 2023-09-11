class Station
  attr_reader :station_trains
  def initialize(name)
    @station_name = name
    @station_trains = []
    @station_trains_type = {}
  end

  def bring_train (train)
    if train.class == Train
      @station_trains << train
      @station_trains_type[train.train_type] << train.train_id
    else
      puts "It's not a train"
    end

  def send_train (train)
    if @station_trains.include?(train)
      @station_trains.delete(train)
      @station_trains_type[train.train_type].delete(train.train_id)
  end
