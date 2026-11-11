require "test_helper"

class DownloadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @download = downloads(:one)
  end

  test "should get index" do
    get downloads_url
    assert_response :success
  end

  test "index JSON contains an array of downloads" do
    get downloads_url(format: :json)

    assert_response :success
    assert_kind_of Array, response.parsed_body.fetch("data")
  end

  test "should get total downloads" do
    get total_downloads_url

    assert_response :success
    assert_equal Download.count, response.parsed_body.fetch("total_downloads")
  end

  test "should get new" do
    get new_download_url
    assert_response :success
  end

  test "should create download" do
    assert_difference("Download.count") do
      post downloads_url, params: { download: { download: @download.download } }
    end

    assert_redirected_to download_url(Download.last)
  end

  test "should show download" do
    get download_url(@download)
    assert_response :success
  end

  test "should get edit" do
    get edit_download_url(@download)
    assert_response :success
  end

  test "should update download" do
    patch download_url(@download), params: { download: { download: @download.download } }
    assert_redirected_to download_url(@download)
  end

  test "should destroy download" do
    assert_difference("Download.count", -1) do
      delete download_url(@download)
    end

    assert_redirected_to downloads_url
  end
end
