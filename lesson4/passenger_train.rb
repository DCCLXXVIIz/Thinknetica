class PassengerTrain < Train

  def add_carriage
    @carriages << PassengerCarriage.new if @speed.zero?
  end
end
