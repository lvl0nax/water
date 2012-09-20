require 'test_helper'

class QuickOrdersControllerTest < ActionController::TestCase
  setup do
    @quick_order = quick_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quick_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quick_order" do
    assert_difference('QuickOrder.count') do
      post :create, quick_order: @quick_order.attributes
    end

    assert_redirected_to quick_order_path(assigns(:quick_order))
  end

  test "should show quick_order" do
    get :show, id: @quick_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quick_order
    assert_response :success
  end

  test "should update quick_order" do
    put :update, id: @quick_order, quick_order: @quick_order.attributes
    assert_redirected_to quick_order_path(assigns(:quick_order))
  end

  test "should destroy quick_order" do
    assert_difference('QuickOrder.count', -1) do
      delete :destroy, id: @quick_order
    end

    assert_redirected_to quick_orders_path
  end
end
