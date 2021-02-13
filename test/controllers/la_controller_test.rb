require 'test_helper'

class LaControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get la_top_url
    assert_response :success
  end

  test "should get first" do
    get la_first_url
    assert_response :success
  end

  test "should get news" do
    get la_news_url
    assert_response :success
  end

  test "should get info" do
    get la_info_url
    assert_response :success
  end

  test "should get calender" do
    get la_calender_url
    assert_response :success
  end

  test "should get map" do
    get la_map_url
    assert_response :success
  end

  test "should get search" do
    get la_search_url
    assert_response :success
  end

end
