require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | Whiskey Gaming"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Whiskey Gaming"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About Us | Whiskey Gaming"
  end

  test "should get teams" do
    get teams_path
    assert_response :success
    assert_select "title", "Teams | Whiskey Gaming"
  end

  test "should get leaderboards" do
    get leaderboards_path
    assert_response :success
    assert_select "title", "Leaderboards | Whiskey Gaming"
  end

  test "should get news" do
    get news_path
    assert_response :success
    assert_select "title", "News | Whiskey Gaming"
  end



end
