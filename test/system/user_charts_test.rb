require "application_system_test_case"

class UserChartsTest < ApplicationSystemTestCase
  setup do
    @user_chart = user_charts(:one)
  end

  test "visiting the index" do
    visit user_charts_url
    assert_selector "h1", text: "User charts"
  end

  test "should create user chart" do
    visit user_charts_url
    click_on "New user chart"

    fill_in "User name", with: @user_chart.user_name
    click_on "Create User chart"

    assert_text "User chart was successfully created"
    click_on "Back"
  end

  test "should update User chart" do
    visit user_chart_url(@user_chart)
    click_on "Edit this user chart", match: :first

    fill_in "User name", with: @user_chart.user_name
    click_on "Update User chart"

    assert_text "User chart was successfully updated"
    click_on "Back"
  end

  test "should destroy User chart" do
    visit user_chart_url(@user_chart)
    click_on "Destroy this user chart", match: :first

    assert_text "User chart was successfully destroyed"
  end
end
