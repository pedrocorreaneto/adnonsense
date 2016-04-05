require 'test_helper'

class CreativeTest < ActiveSupport::TestCase
  test "creative without any argument" do
    creative = Creative.new 
    assert_not creative.save
  end
  test "creative without bid" do
    creative = Creative.new
    creative.budget = 3
    creative.adtext= "Some text"
    assert_not creative.save
  end
  test "creative without adtext" do
    creative = Creative.new
    creative.budget = 3
    creative.bid = 2
    assert_not creative.save
  end
  test "creative with budget less than bid" do
    creative = Creative.new
    creative.budget = 3
    creative.bid = 5
    creative.adtext= "Some text"
    assert_not creative.save
  end
  test "creative pass" do
    creative = Creative.new
    creative.budget = 3
    creative.bid = 2
    creative.adtext= "Some text"
    assert creative.save
  end
end
