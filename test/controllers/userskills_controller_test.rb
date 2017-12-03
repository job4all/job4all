require 'test_helper'

class UserskillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userskill = userskills(:one)
  end

  test "should get index" do
    get userskills_url
    assert_response :success
  end

  test "should get new" do
    get new_userskill_url
    assert_response :success
  end

  test "should create userskill" do
    assert_difference('Userskill.count') do
      post userskills_url, params: { userskill: { lastd: @userskill.lastd, skill_id: @userskill.skill_id, user_id: @userskill.user_id } }
    end

    assert_redirected_to userskill_url(Userskill.last)
  end

  test "should show userskill" do
    get userskill_url(@userskill)
    assert_response :success
  end

  test "should get edit" do
    get edit_userskill_url(@userskill)
    assert_response :success
  end

  test "should update userskill" do
    patch userskill_url(@userskill), params: { userskill: { lastd: @userskill.lastd, skill_id: @userskill.skill_id, user_id: @userskill.user_id } }
    assert_redirected_to userskill_url(@userskill)
  end

  test "should destroy userskill" do
    assert_difference('Userskill.count', -1) do
      delete userskill_url(@userskill)
    end

    assert_redirected_to userskills_url
  end
end
