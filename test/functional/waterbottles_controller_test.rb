require 'test_helper'

class WaterbottlesControllerTest < ActionController::TestCase
  setup do
    @waterbottle = waterbottles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:waterbottles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create waterbottle" do
    assert_difference('Waterbottle.count') do
      post :create, waterbottle: @waterbottle.attributes
    end

    assert_redirected_to waterbottle_path(assigns(:waterbottle))
  end

  test "should show waterbottle" do
    get :show, id: @waterbottle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @waterbottle
    assert_response :success
  end

  test "should update waterbottle" do
    put :update, id: @waterbottle, waterbottle: @waterbottle.attributes
    assert_redirected_to waterbottle_path(assigns(:waterbottle))
  end

  test "should destroy waterbottle" do
    assert_difference('Waterbottle.count', -1) do
      delete :destroy, id: @waterbottle
    end

    assert_redirected_to waterbottles_path
  end
end
