require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Activation reason", with: @product.activation_reason
    fill_in "Active", with: @product.active
    fill_in "Author", with: @product.author
    fill_in "Barcode", with: @product.barcode
    fill_in "Dimensions", with: @product.dimensions
    fill_in "Edition", with: @product.edition
    fill_in "Isbn", with: @product.isbn
    fill_in "Pages", with: @product.pages
    fill_in "Publisher", with: @product.publisher
    fill_in "Synopsis", with: @product.synopsis
    fill_in "Title", with: @product.title
    fill_in "Year", with: @product.year
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Activation reason", with: @product.activation_reason
    fill_in "Active", with: @product.active
    fill_in "Author", with: @product.author
    fill_in "Barcode", with: @product.barcode
    fill_in "Dimensions", with: @product.dimensions
    fill_in "Edition", with: @product.edition
    fill_in "Isbn", with: @product.isbn
    fill_in "Pages", with: @product.pages
    fill_in "Publisher", with: @product.publisher
    fill_in "Synopsis", with: @product.synopsis
    fill_in "Title", with: @product.title
    fill_in "Year", with: @product.year
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
