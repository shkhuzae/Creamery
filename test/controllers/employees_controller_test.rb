require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_employees
  end
  
  teardown do
    remove_employees
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: { active: @cindy.active, date_of_birth: @cindy.date_of_birth, first_name: @cindy.first_name, last_name: @cindy.last_name, phone: @cindy.phone, role: @cindy.role, ssn: @cindy.ssn } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@cindy)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@cindy)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@cindy), params: { employee: { active: @cindy.active, date_of_birth: @cindy.date_of_birth, first_name: @cindy.first_name, last_name: @cindy.last_name, phone: @cindy.phone, role: @cindy.role, ssn: @cindy.ssn } }
    assert_redirected_to employee_url(@cindy)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@cindy)
    end

    assert_redirected_to employees_url
  end
end
