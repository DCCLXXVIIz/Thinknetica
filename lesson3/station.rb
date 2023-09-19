require_relative 'train'

class Station
  attr_reader :s_trains, :s_name
  def initialize(name)
    @s_name = name
    @s_trains = []
  end

  def s_bring_train (train)
    @s_trains << train if train.class == Train
  end

  def s_send_train (train)
    @s_trains.delete(train) if @s_trains.include?(train)
  end

  def s_train_list
    @s_trains.each {|index| puts index.t_id}
  end

  def s_trains_type_list
    @s_trains.each {|index| puts index.t_type}
  end
end
