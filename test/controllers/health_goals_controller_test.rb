require 'test_helper'

class HealthGoalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @health_goal = health_goals(:one)
  end

  test "should get index" do
    get health_goals_url
    assert_response :success
  end

  test "should get new" do
    get new_health_goal_url
    assert_response :success
  end

  test "should create health_goal" do
    assert_difference('HealthGoal.count') do
      post health_goals_url, params: { health_goal: { goal_desc: @health_goal.goal_desc, goal_name: @health_goal.goal_name } }
    end

    assert_redirected_to health_goal_url(HealthGoal.last)
  end

  test "should show health_goal" do
    get health_goal_url(@health_goal)
    assert_response :success
  end

  test "should get edit" do
    get edit_health_goal_url(@health_goal)
    assert_response :success
  end

  test "should update health_goal" do
    patch health_goal_url(@health_goal), params: { health_goal: { goal_desc: @health_goal.goal_desc, goal_name: @health_goal.goal_name } }
    assert_redirected_to health_goal_url(@health_goal)
  end

  test "should destroy health_goal" do
    assert_difference('HealthGoal.count', -1) do
      delete health_goal_url(@health_goal)
    end

    assert_redirected_to health_goals_url
  end
end
