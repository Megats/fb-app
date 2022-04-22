require "application_system_test_case"

class ActiveChartsTest < ApplicationSystemTestCase
  setup do
    @active_chart = active_charts(:one)
  end

  test "visiting the index" do
    visit active_charts_url
    assert_selector "h1", text: "Active charts"
  end

  test "should create active chart" do
    visit active_charts_url
    click_on "New active chart"

    fill_in "Comment activetime", with: @active_chart.comment_activetime
    fill_in "Post activetime", with: @active_chart.post_activetime
    fill_in "User", with: @active_chart.user_id
    click_on "Create Active chart"

    assert_text "Active chart was successfully created"
    click_on "Back"
  end

  test "should update Active chart" do
    visit active_chart_url(@active_chart)
    click_on "Edit this active chart", match: :first

    fill_in "Comment activetime", with: @active_chart.comment_activetime
    fill_in "Post activetime", with: @active_chart.post_activetime
    fill_in "User", with: @active_chart.user_id
    click_on "Update Active chart"

    assert_text "Active chart was successfully updated"
    click_on "Back"
  end

  test "should destroy Active chart" do
    visit active_chart_url(@active_chart)
    click_on "Destroy this active chart", match: :first

    assert_text "Active chart was successfully destroyed"
  end
end
