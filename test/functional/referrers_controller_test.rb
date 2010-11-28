require 'test_helper'

class ReferrersControllerTest < ActionController::TestCase
  setup do
    @referrer = referrers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referrers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referrer" do
    assert_difference('Referrer.count') do
      post :create, :referrer => @referrer.attributes
    end

    assert_redirected_to referrer_path(assigns(:referrer))
  end

  test "should show referrer" do
    get :show, :id => @referrer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @referrer.to_param
    assert_response :success
  end

  test "should update referrer" do
    put :update, :id => @referrer.to_param, :referrer => @referrer.attributes
    assert_redirected_to referrer_path(assigns(:referrer))
  end

  test "should destroy referrer" do
    assert_difference('Referrer.count', -1) do
      delete :destroy, :id => @referrer.to_param
    end

    assert_redirected_to referrers_path
  end
end
