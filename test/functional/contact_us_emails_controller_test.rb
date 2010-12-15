require 'test_helper'

class ContactUsEmailsControllerTest < ActionController::TestCase
  setup do
    @contact_us_email = contact_us_emails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_us_emails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_us_email" do
    assert_difference('ContactUsEmail.count') do
      post :create, :contact_us_email => @contact_us_email.attributes
    end

    assert_redirected_to contact_us_email_path(assigns(:contact_us_email))
  end

  test "should show contact_us_email" do
    get :show, :id => @contact_us_email.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contact_us_email.to_param
    assert_response :success
  end

  test "should update contact_us_email" do
    put :update, :id => @contact_us_email.to_param, :contact_us_email => @contact_us_email.attributes
    assert_redirected_to contact_us_email_path(assigns(:contact_us_email))
  end

  test "should destroy contact_us_email" do
    assert_difference('ContactUsEmail.count', -1) do
      delete :destroy, :id => @contact_us_email.to_param
    end

    assert_redirected_to contact_us_emails_path
  end
end
