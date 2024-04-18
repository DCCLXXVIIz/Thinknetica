class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
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

end
