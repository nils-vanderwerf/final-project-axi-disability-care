require "test_helper"

class addressControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = address(:one)
  end

  test "should get index" do
    get address_url
    assert_response :success
  end

  test "should get new" do
    get new_address_url
    assert_response :success
  end

  test "should create address" do
    assert_difference('address.count') do
      post address_url, params: { address: {  } }
    end

    assert_redirected_to address_url(address.last)
  end

  test "should show address" do
    get address_url(@address)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_url(@address)
    assert_response :success
  end

  test "should update address" do
    patch address_url(@address), params: { address: {  } }
    assert_redirected_to address_url(@address)
  end

  test "should destroy address" do
    assert_difference('address.count', -1) do
      delete address_url(@address)
    end

    assert_redirected_to address_url
  end
end
