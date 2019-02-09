require 'test_helper'

class AssignMarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assign_marks_index_url
    assert_response :success
  end

  test "should get new" do
    get assign_marks_new_url
    assert_response :success
  end

end
