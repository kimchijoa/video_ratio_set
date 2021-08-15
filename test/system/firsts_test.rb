require "application_system_test_case"

class FirstsTest < ApplicationSystemTestCase
  setup do
    @first = firsts(:one)
  end

  test "visiting the index" do
    visit firsts_url
    assert_selector "h1", text: "Firsts"
  end

  test "creating a First" do
    visit firsts_url
    click_on "New First"

    click_on "Create First"

    assert_text "First was successfully created"
    click_on "Back"
  end

  test "updating a First" do
    visit firsts_url
    click_on "Edit", match: :first

    click_on "Update First"

    assert_text "First was successfully updated"
    click_on "Back"
  end

  test "destroying a First" do
    visit firsts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "First was successfully destroyed"
  end
end
