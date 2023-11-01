class CargoTrain < Train
  def add_carriage
    @carriages << CargoCarriage.new if @speed.zero?
  end

end
