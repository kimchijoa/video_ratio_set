require 'test_helper'

class SaveVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @save_video = save_videos(:one)
  end

  test "should get index" do
    get save_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_save_video_url
    assert_response :success
  end

  test "should create save_video" do
    assert_difference('SaveVideo.count') do
      post save_videos_url, params: { save_video: { string: @save_video.string } }
    end

    assert_redirected_to save_video_url(SaveVideo.last)
  end

  test "should show save_video" do
    get save_video_url(@save_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_save_video_url(@save_video)
    assert_response :success
  end

  test "should update save_video" do
    patch save_video_url(@save_video), params: { save_video: { string: @save_video.string } }
    assert_redirected_to save_video_url(@save_video)
  end

  test "should destroy save_video" do
    assert_difference('SaveVideo.count', -1) do
      delete save_video_url(@save_video)
    end

    assert_redirected_to save_videos_url
  end
end
