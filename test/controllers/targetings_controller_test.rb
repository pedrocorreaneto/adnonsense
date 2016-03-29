require 'test_helper'

class TargetingsControllerTest < ActionController::TestCase
  setup do
    @targeting = targetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:targetings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create targeting" do
    assert_difference('Targeting.count') do
      post :create, targeting: { ad_id: @targeting.ad_id, gender: @targeting.gender, places: @targeting.places }
    end

    assert_redirected_to targeting_path(assigns(:targeting))
  end

  test "should show targeting" do
    get :show, id: @targeting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @targeting
    assert_response :success
  end

  test "should update targeting" do
    patch :update, id: @targeting, targeting: { ad_id: @targeting.ad_id, gender: @targeting.gender, places: @targeting.places }
    assert_redirected_to targeting_path(assigns(:targeting))
  end

  test "should destroy targeting" do
    assert_difference('Targeting.count', -1) do
      delete :destroy, id: @targeting
    end

    assert_redirected_to targetings_path
  end
end
