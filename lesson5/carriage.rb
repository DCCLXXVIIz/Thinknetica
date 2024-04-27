require_relative './vendor'

class Carriage
  include Vendor
  attr_reader :type, :name

  def initialize (number)
    @name = number
  end
end
