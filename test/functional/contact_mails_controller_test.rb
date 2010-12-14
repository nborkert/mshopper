require 'test_helper'

class ContactMailsControllerTest < ActionController::TestCase
  setup do
    @contact_mail = contact_mails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_mails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_mail" do
    assert_difference('ContactMail.count') do
      post :create, :contact_mail => @contact_mail.attributes
    end

    assert_redirected_to contact_mail_path(assigns(:contact_mail))
  end

  test "should show contact_mail" do
    get :show, :id => @contact_mail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contact_mail.to_param
    assert_response :success
  end

  test "should update contact_mail" do
    put :update, :id => @contact_mail.to_param, :contact_mail => @contact_mail.attributes
    assert_redirected_to contact_mail_path(assigns(:contact_mail))
  end

  test "should destroy contact_mail" do
    assert_difference('ContactMail.count', -1) do
      delete :destroy, :id => @contact_mail.to_param
    end

    assert_redirected_to contact_mails_path
  end
end
