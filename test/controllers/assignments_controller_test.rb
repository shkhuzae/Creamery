require 'test_helper'

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_stores
    create_employees
    create_assignments
  end
  
  teardown do
    remove_stores
    remove_employees
    remove_assignments
  end
  
  test "should get index" do
    get assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_assignment_url
    assert_response :success
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post assignments_url, params: { assignment: { employee_id: @assign_ben.employee_id, end_date: @assign_ben.end_date, pay_level: @assign_ben.pay_level, start_date: @assign_ben.start_date, store_id: @assign_ben.store_id } }
    end

    assert_redirected_to assignment_url(Assignment.last)
  end

  test "should show assignment" do
    get assignment_url(@assign_ben)
    assert_response :success
  end

  test "should show current assignments" do
    get current_assignments_path
    assert_response :success
  end
  
  test "should show past assignments" do
    get past_assignments_path
    assert_response :success
  end
 
  test "should show assignments by store" do
    get bystore_assignments_path
    assert_response :success
  end 

  test "should show assignments by employee" do
    get byemployee_assignments_path
    assert_response :success
  end 

  test "should get edit" do
    get edit_assignment_url(@assign_ben)
    assert_response :success
  end

  test "should update assignment" do
    patch assignment_url(@assign_ben), params: { assignment: { employee_id: @assign_ben.employee_id, end_date: @assign_ben.end_date, pay_level: @assign_ben.pay_level, start_date: @assign_ben.start_date, store_id: @assign_ben.store_id } }
    assert_redirected_to assignment_url(@assign_ben)
  end

  test "should destroy assignment" do
    assert_difference('Assignment.count', -1) do
      delete assignment_url(@assign_ben)
    end

    assert_redirected_to assignments_url
  end
end
