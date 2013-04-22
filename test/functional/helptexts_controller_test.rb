require 'test_helper'

class HelptextsControllerTest < ActionController::TestCase
  setup do
    @helptext = helptexts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:helptexts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create helptext" do
    assert_difference('Helptext.count') do
      post :create, helptext: @helptext.attributes
    end

    assert_redirected_to helptext_path(assigns(:helptext))
  end

  test "should show helptext" do
    get :show, id: @helptext
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @helptext
    assert_response :success
  end

  test "should update helptext" do
    put :update, id: @helptext, helptext: @helptext.attributes
    assert_redirected_to helptext_path(assigns(:helptext))
  end

  test "should destroy helptext" do
    assert_difference('Helptext.count', -1) do
      delete :destroy, id: @helptext
    end

    assert_redirected_to helptexts_path
  end
end
