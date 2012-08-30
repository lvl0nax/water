require 'test_helper'

class SpecoffersControllerTest < ActionController::TestCase
  setup do
    @specoffer = specoffers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specoffers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specoffer" do
    assert_difference('Specoffer.count') do
      post :create, specoffer: @specoffer.attributes
    end

    assert_redirected_to specoffer_path(assigns(:specoffer))
  end

  test "should show specoffer" do
    get :show, id: @specoffer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @specoffer
    assert_response :success
  end

  test "should update specoffer" do
    put :update, id: @specoffer, specoffer: @specoffer.attributes
    assert_redirected_to specoffer_path(assigns(:specoffer))
  end

  test "should destroy specoffer" do
    assert_difference('Specoffer.count', -1) do
      delete :destroy, id: @specoffer
    end

    assert_redirected_to specoffers_path
  end
end
