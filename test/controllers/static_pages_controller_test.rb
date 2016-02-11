require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
      assert_select "title", "Bienvenido | iXGlocal C.A"
  end

  test "should get acerca" do
    get :acerca
    assert_response :success
      assert_select "title", "Acerca | iXGlocal C.A"
  end

  test "should get servicios" do
    get :servicios
    assert_response :success
      assert_select "title", "Servicios | iXGlocal C.A"
  end

end
