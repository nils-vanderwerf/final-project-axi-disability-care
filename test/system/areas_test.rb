require "application_system_test_case"

class addressesTest < ApplicationSystemTestCase
  setup do
    @address = addresses(:one)
  end

  test "visiting the index" do
    visit addresses_url
    assert_selector "h1", text: "addresses"
  end

  test "creating a address" do
    visit addresses_url
    click_on "New address"

    click_on "Create address"

    assert_text "address was successfully created"
    click_on "Back"
  end

  test "updating a address" do
    visit addresses_url
    click_on "Edit", match: :first

    click_on "Update address"

    assert_text "address was successfully updated"
    click_on "Back"
  end

  test "destroying a address" do
    visit addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "address was successfully destroyed"
  end
end
