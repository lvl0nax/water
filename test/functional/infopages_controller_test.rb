require 'test_helper'

class InfopagesControllerTest < ActionController::TestCase
  setup do
    @infopage = infopages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:infopages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create infopage" do
    assert_difference('Infopage.count') do
      post :create, infopage: @infopage.attributes
    end

    assert_redirected_to infopage_path(assigns(:infopage))
  end

  test "should show infopage" do
    get :show, id: @infopage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @infopage
    assert_response :success
  end

  test "should update infopage" do
    put :update, id: @infopage, infopage: @infopage.attributes
    assert_redirected_to infopage_path(assigns(:infopage))
  end

  test "should destroy infopage" do
    assert_difference('Infopage.count', -1) do
      delete :destroy, id: @infopage
    end

    assert_redirected_to infopages_path
  end
end
