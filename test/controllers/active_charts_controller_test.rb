require "test_helper"

class ActiveChartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @active_chart = active_charts(:one)
  end

  test "should get index" do
    get active_charts_url
    assert_response :success
  end

  test "should get new" do
    get new_active_chart_url
    assert_response :success
  end

  test "should create active_chart" do
    assert_difference("ActiveChart.count") do
      post active_charts_url, params: { active_chart: { comment_activetime: @active_chart.comment_activetime, post_activetime: @active_chart.post_activetime, user_id: @active_chart.user_id } }
    end

    assert_redirected_to active_chart_url(ActiveChart.last)
  end

  test "should show active_chart" do
    get active_chart_url(@active_chart)
    assert_response :success
  end

  test "should get edit" do
    get edit_active_chart_url(@active_chart)
    assert_response :success
  end

  test "should update active_chart" do
    patch active_chart_url(@active_chart), params: { active_chart: { comment_activetime: @active_chart.comment_activetime, post_activetime: @active_chart.post_activetime, user_id: @active_chart.user_id } }
    assert_redirected_to active_chart_url(@active_chart)
  end

  test "should destroy active_chart" do
    assert_difference("ActiveChart.count", -1) do
      delete active_chart_url(@active_chart)
    end

    assert_redirected_to active_charts_url
  end
end
