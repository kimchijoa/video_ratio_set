require "application_system_test_case"

class SaveVideosTest < ApplicationSystemTestCase
  setup do
    @save_video = save_videos(:one)
  end

  test "visiting the index" do
    visit save_videos_url
    assert_selector "h1", text: "Save Videos"
  end

  test "creating a Save video" do
    visit save_videos_url
    click_on "New Save Video"

    fill_in "String", with: @save_video.string
    click_on "Create Save video"

    assert_text "Save video was successfully created"
    click_on "Back"
  end

  test "updating a Save video" do
    visit save_videos_url
    click_on "Edit", match: :first

    fill_in "String", with: @save_video.string
    click_on "Update Save video"

    assert_text "Save video was successfully updated"
    click_on "Back"
  end

  test "destroying a Save video" do
    visit save_videos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Save video was successfully destroyed"
  end
end
