module InstanceCounter
  @@counter = 0

  def instances
    @@counter
  end

  protected
  def register_instance
    @@counter += 1
  end
end