require "application_system_test_case"

class ProductManagementsTest < ApplicationSystemTestCase
  setup do
    @product_management = product_managements(:one)
  end

  test "visiting the index" do
    visit product_managements_url
    assert_selector "h1", text: "Product Managements"
  end

  test "creating a Product management" do
    visit product_managements_url
    click_on "New Product Management"

    click_on "Create Product management"

    assert_text "Product management was successfully created"
    click_on "Back"
  end

  test "updating a Product management" do
    visit product_managements_url
    click_on "Edit", match: :first

    click_on "Update Product management"

    assert_text "Product management was successfully updated"
    click_on "Back"
  end

  test "destroying a Product management" do
    visit product_managements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product management was successfully destroyed"
  end
end
