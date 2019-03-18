require 'test_helper'

class PriceGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price_group = price_groups(:one)
  end

  test "should get index" do
    get price_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_price_group_url
    assert_response :success
  end

  test "should create price_group" do
    assert_difference('PriceGroup.count') do
      post price_groups_url, params: { price_group: { description: @price_group.description, prefix: @price_group.prefix } }
    end

    assert_redirected_to price_group_url(PriceGroup.last)
  end

  test "should show price_group" do
    get price_group_url(@price_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_price_group_url(@price_group)
    assert_response :success
  end

  test "should update price_group" do
    patch price_group_url(@price_group), params: { price_group: { description: @price_group.description, prefix: @price_group.prefix } }
    assert_redirected_to price_group_url(@price_group)
  end

  test "should destroy price_group" do
    assert_difference('PriceGroup.count', -1) do
      delete price_group_url(@price_group)
    end

    assert_redirected_to price_groups_url
  end
end
