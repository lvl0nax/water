require 'test_helper'

class CoolersControllerTest < ActionController::TestCase
  setup do
    @cooler = coolers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coolers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cooler" do
    assert_difference('Cooler.count') do
      post :create, cooler: @cooler.attributes
    end

    assert_redirected_to cooler_path(assigns(:cooler))
  end

  test "should show cooler" do
    get :show, id: @cooler
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cooler
    assert_response :success
  end

  test "should update cooler" do
    put :update, id: @cooler, cooler: @cooler.attributes
    assert_redirected_to cooler_path(assigns(:cooler))
  end

  test "should destroy cooler" do
    assert_difference('Cooler.count', -1) do
      delete :destroy, id: @cooler
    end

    assert_redirected_to coolers_path
  end
end
