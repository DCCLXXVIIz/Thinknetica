require_relative './debugger'
require_relative './instance_counter'

class CargoTrain < Train
  def initialize(number)
    @type = :cargo
    super
  end
end
