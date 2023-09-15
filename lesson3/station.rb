require_relative 'train'

class Station
  attr_reader :station_trains, :station_name
  def initialize(name)
    @station_name = name
    @station_trains = []
    @station_trains_type = {"cargo" => [], "passanger" => []}
  end

  def station_bring_train (train)
    if train.class == Train
      @station_trains << train
      @station_trains_type[train.train_type] << train.train_id
    else
      puts "It's not a train"
    end
  end

  def station_send_train (train)
    if @station_trains.include?(train)
      @station_trains.delete(train)
      @station_trains_type[train.train_type].delete(train.train_id)
    else
      puts "Invalid input"
    end
  end

  def station_train_list
    @station_trains.each {|index| puts index.train_id}
  end

  def station_trains_type_list
    puts "Cargo trains #{@station_trains_type["cargo"]}"
    puts "Passanger trains #{@station_trains_type["passanger"]}"
  end
end
