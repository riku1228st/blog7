require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get home_top_url
    assert_response :success
  end

  test "should get first" do
    get home_first_url
    assert_response :success
  end

  test "should get news" do
    get home_news_url
    assert_response :success
  end

  test "should get info" do
    get home_info_url
    assert_response :success
  end

  test "should get calender" do
    get home_calender_url
    assert_response :success
  end

  test "should get map" do
    get home_map_url
    assert_response :success
  end

  test "should get search" do
    get home_search_url
    assert_response :success
  end

end
