require "application_system_test_case"

class addressTest < ApplicationSystemTestCase
  setup do
    @address = address(:one)
  end

  test "visiting the index" do
    visit address_url
    assert_selector "h1", text: "address"
  end

  test "creating a address" do
    visit address_url
    click_on "New address"

    click_on "Create address"

    assert_text "address was successfully created"
    click_on "Back"
  end

  test "updating a address" do
    visit address_url
    click_on "Edit", match: :first

    click_on "Update address"

    assert_text "address was successfully updated"
    click_on "Back"
  end

  test "destroying a address" do
    visit address_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "address was successfully destroyed"
  end
end
