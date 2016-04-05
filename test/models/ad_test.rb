require 'test_helper'

class AdTest < ActiveSupport::TestCase
  test "ad clean" do
    ad=Ad.new
    assert_not ad.save, "ad without any argument"
  end
  test "ad without creative without targeting" do
    ad = Ad.new
    ad.budget = 1
    assert_not ad.save, "ad without creative without targeting"
  end
  test "ad without creative" do 
    ad = Ad.new
    ad.budget = 2
    targeting = ad.targetings.build
    assert_not ad.save, "ad without creative"
  end
  test "ad without targeting" do
    ad = Ad.new
    ad.budget = 2
    creative = ad.creatives.build
    creative.bid=1
    creative.budget = ad.budget
    creative.adtext="Some text" 
    assert_not ad.save, "ad without targeting"
  end
  test "ad correct" do
    ad = Ad.new
    ad.budget = 2
    creative = ad.creatives.build
    creative.bid=1
    creative.budget = ad.budget
    creative.adtext="Some text"
    targeting = ad.targetings.build
    assert ad.save, "ad correct"
  end
end
