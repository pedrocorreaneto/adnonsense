require 'test_helper'

class AdsControllerTest < ActionController::TestCase
  setup do
    @ad = ads(:one)
    @creative = creatives(:one)
    @targeting = targetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ad" do
    assert_difference('Ad.count') do
      post :create, ad: { budget: @ad.budget, creatives_attributes: {'0' => {bid: @creative.bid, adtext: @creative.adtext}}, targetings_attributes: {'0'=> {places: @targeting.places, gender: @targeting.gender}}}
    end

    assert_redirected_to ad_path(assigns(:ad))
  end

  test "should show ad" do
    get :show, id: @ad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ad
    assert_response :success
  end

  test "should update ad" do
    ad=ads(:two)
    creative = creatives(:two)
    targeting = targetings(:two)
    patch :update, id: @ad, ad: { budget: ad.budget, creatives_attributes: {'0' => {bid: creative.bid, adtext: creative.adtext}}, targetings_attributes: {'0'=> {places: targeting.places, gender: targeting.gender}}}
    assert_redirected_to ad_path(assigns(:ad))
  end

  test "should destroy ad" do
    assert_difference('Ad.count', -1) do
      delete :destroy, id: @ad
    end

    assert_redirected_to ads_path
  end
end
