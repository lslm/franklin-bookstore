require "application_system_test_case"

class PriceGroupsTest < ApplicationSystemTestCase
  setup do
    @price_group = price_groups(:one)
  end

  test "visiting the index" do
    visit price_groups_url
    assert_selector "h1", text: "Price Groups"
  end

  test "creating a Price group" do
    visit price_groups_url
    click_on "New Price Group"

    fill_in "Description", with: @price_group.description
    fill_in "Prefix", with: @price_group.prefix
    click_on "Create Price group"

    assert_text "Price group was successfully created"
    click_on "Back"
  end

  test "updating a Price group" do
    visit price_groups_url
    click_on "Edit", match: :first

    fill_in "Description", with: @price_group.description
    fill_in "Prefix", with: @price_group.prefix
    click_on "Update Price group"

    assert_text "Price group was successfully updated"
    click_on "Back"
  end

  test "destroying a Price group" do
    visit price_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Price group was successfully destroyed"
  end
end
