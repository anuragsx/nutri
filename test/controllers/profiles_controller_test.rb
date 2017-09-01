require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { alcohol: @profile.alcohol, breakfast: @profile.breakfast, date_of_birth: @profile.date_of_birth, dinner: @profile.dinner, food_allergies: @profile.food_allergies, food_preference: @profile.food_preference, health_goal: @profile.health_goal, height: @profile.height, lunch: @profile.lunch, medical_condition_id: @profile.medical_condition_id, smoking: @profile.smoking, user_id: @profile.user_id, weight: @profile.weight } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { alcohol: @profile.alcohol, breakfast: @profile.breakfast, date_of_birth: @profile.date_of_birth, dinner: @profile.dinner, food_allergies: @profile.food_allergies, food_preference: @profile.food_preference, health_goal: @profile.health_goal, height: @profile.height, lunch: @profile.lunch, medical_condition_id: @profile.medical_condition_id, smoking: @profile.smoking, user_id: @profile.user_id, weight: @profile.weight } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
