require 'test_helper'

class CurrencyConvertsControllerTest < ActionController::TestCase
  setup do
    @currency_convert = currency_converts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:currency_converts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create currency_convert" do
    assert_difference('CurrencyConvert.count') do
      post :create, currency_convert: { currency: @currency_convert.currency }
    end

    assert_redirected_to currency_convert_path(assigns(:currency_convert))
  end

  test "should show currency_convert" do
    get :show, id: @currency_convert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @currency_convert
    assert_response :success
  end

  test "should update currency_convert" do
    patch :update, id: @currency_convert, currency_convert: { currency: @currency_convert.currency }
    assert_redirected_to currency_convert_path(assigns(:currency_convert))
  end

  test "should destroy currency_convert" do
    assert_difference('CurrencyConvert.count', -1) do
      delete :destroy, id: @currency_convert
    end

    assert_redirected_to currency_converts_path
  end
end
