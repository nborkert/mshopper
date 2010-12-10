require 'test_helper'

class EvOwnersControllerTest < ActionController::TestCase
  setup do
    @ev_owner = ev_owners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ev_owners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ev_owner" do
    assert_difference('EvOwner.count') do
      post :create, :ev_owner => @ev_owner.attributes
    end

    assert_redirected_to ev_owner_path(assigns(:ev_owner))
  end

  test "should show ev_owner" do
    get :show, :id => @ev_owner.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ev_owner.to_param
    assert_response :success
  end

  test "should update ev_owner" do
    put :update, :id => @ev_owner.to_param, :ev_owner => @ev_owner.attributes
    assert_redirected_to ev_owner_path(assigns(:ev_owner))
  end

  test "should destroy ev_owner" do
    assert_difference('EvOwner.count', -1) do
      delete :destroy, :id => @ev_owner.to_param
    end

    assert_redirected_to ev_owners_path
  end
end
