require 'test_helper'

class RequestCallsControllerTest < ActionController::TestCase
  setup do
    @request_call = request_calls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_calls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_call" do
    assert_difference('RequestCall.count') do
      post :create, request_call: @request_call.attributes
    end

    assert_redirected_to request_call_path(assigns(:request_call))
  end

  test "should show request_call" do
    get :show, id: @request_call
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_call
    assert_response :success
  end

  test "should update request_call" do
    put :update, id: @request_call, request_call: @request_call.attributes
    assert_redirected_to request_call_path(assigns(:request_call))
  end

  test "should destroy request_call" do
    assert_difference('RequestCall.count', -1) do
      delete :destroy, id: @request_call
    end

    assert_redirected_to request_calls_path
  end
end
