require 'test_helper'

class OthersControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get others_top_url
    assert_response :success
  end

  test "should get first" do
    get others_first_url
    assert_response :success
  end

  test "should get news" do
    get others_news_url
    assert_response :success
  end

  test "should get info" do
    get others_info_url
    assert_response :success
  end

  test "should get calender" do
    get others_calender_url
    assert_response :success
  end

  test "should get map" do
    get others_map_url
    assert_response :success
  end

  test "should get search" do
    get others_search_url
    assert_response :success
  end

  test "should get contact" do
    get others_contact_url
    assert_response :success
  end

  test "should get privacy-policy" do
    get others_privacy-policy_url
    assert_response :success
  end

  test "should get disclaimer" do
    get others_disclaimer_url
    assert_response :success
  end

end
