class Station
  attr_reader :trains, :station_name
  def initialize(name)
    @station_name = name
    @trains = []
  end

  def bring_train (train)
    @trains << train if train.class == Train
  end

  def send_train (train)
    @trains.delete(train) if @trains.include?(train)
  end

  def train_list
    @trains.each {|index| puts index.id}
  end

end
