require_relative './vendor'
require_relative './instance_counter'

module Debugger
  def self.included(base)
    base.extend InstanceCounter
  end
end