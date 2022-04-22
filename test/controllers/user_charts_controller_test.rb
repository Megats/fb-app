require "test_helper"

class UserChartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_chart = user_charts(:one)
  end

  test "should get index" do
    get user_charts_url
    assert_response :success
  end

  test "should get new" do
    get new_user_chart_url
    assert_response :success
  end

  test "should create user_chart" do
    assert_difference("UserChart.count") do
      post user_charts_url, params: { user_chart: { user_name: @user_chart.user_name } }
    end

    assert_redirected_to user_chart_url(UserChart.last)
  end

  test "should show user_chart" do
    get user_chart_url(@user_chart)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_chart_url(@user_chart)
    assert_response :success
  end

  test "should update user_chart" do
    patch user_chart_url(@user_chart), params: { user_chart: { user_name: @user_chart.user_name } }
    assert_redirected_to user_chart_url(@user_chart)
  end

  test "should destroy user_chart" do
    assert_difference("UserChart.count", -1) do
      delete user_chart_url(@user_chart)
    end

    assert_redirected_to user_charts_url
  end
end
