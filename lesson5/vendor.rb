module Vendor
  def set_vendor(name)
    self.vendor = name
  end

  def get_vendor
    self.vendor
  end
  
  protected
  attr_accessor :vendor
end