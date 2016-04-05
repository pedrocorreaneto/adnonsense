require 'test_helper'

class TargetingTest < ActiveSupport::TestCase
  test "Targeting pass" do 
    targeting = Targeting.new
    assert targeting.save, "Targeting pass"
  end
  test "Targeting with Places and changing gender" do 
    targeting = Targeting.new
    targeting.places="Some place"
    targeting.gender=:male
    assert targeting.save, "Targeting with Places and changing gender"
  end
end
