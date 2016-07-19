require 'test_helper'

class IceCreamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ice_cream = ice_creams(:one)
  end

  test "should get index" do
    get ice_creams_url
    assert_response :success
  end

  test "should get new" do
    get new_ice_cream_url
    assert_response :success
  end

  test "should create ice_cream" do
    assert_difference('IceCream.count') do
      post ice_creams_url, params: { ice_cream: { cone: @ice_cream.cone, flavour: @ice_cream.flavour, size: @ice_cream.size, type: @ice_cream.type } }
    end

    assert_redirected_to ice_cream_url(IceCream.last)
  end

  test "should show ice_cream" do
    get ice_cream_url(@ice_cream)
    assert_response :success
  end

  test "should get edit" do
    get edit_ice_cream_url(@ice_cream)
    assert_response :success
  end

  test "should update ice_cream" do
    patch ice_cream_url(@ice_cream), params: { ice_cream: { cone: @ice_cream.cone, flavour: @ice_cream.flavour, size: @ice_cream.size, type: @ice_cream.type } }
    assert_redirected_to ice_cream_url(@ice_cream)
  end

  test "should destroy ice_cream" do
    assert_difference('IceCream.count', -1) do
      delete ice_cream_url(@ice_cream)
    end

    assert_redirected_to ice_creams_url
  end
end
