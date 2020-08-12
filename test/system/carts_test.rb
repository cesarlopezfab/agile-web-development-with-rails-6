require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  setup do
    @cart = carts(:one)
  end

  test "visiting the index" do
    visit store_index_url
    assert_selector "h2", text: "Your Cart"
  end

  test "creating a Cart" do
    visit store_index_url
    accept_confirm do 
      click_on "Empty cart"
    end

    assert_text "Your cart is currently empty"

    click_on "Add to Cart"

    assert_text "Your cart"
  end

  test "updating a Cart" do
    visit carts_url
    click_on "Edit", match: :first

    click_on "Update Cart"

    assert_text "Cart was successfully updated"
    click_on "Back"
  end

  test "destroying a Cart" do
    visit carts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Your cart is currently empty"
  end
end
