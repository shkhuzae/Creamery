class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    if current_user.role?(:manager)
      @active_employees = Employee.for_store(current_user.employee.current_assignment.store_id).active.alphabetical.paginate(page: params[:page]).per_page(10)
      @inactive_employees = Employee.for_store(current_user.employee.current_assignment.store_id).inactive.alphabetical.paginate(page: params[:page]).per_page(10)
    else
      @active_employees = Employee.active.alphabetical.paginate(page: params[:page]).per_page(10)
      @inactive_employees = Employee.inactive.alphabetical.paginate(page: params[:page]).per_page(10)
    end
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @assignments = @employee.assignments.chronological.paginate(page: params[:page]).per_page(5)
  end

  #view employees below 18 years old
  def younger 
      @employees = Employee.younger_than_18.alphabetical.paginate(page: params[:page]).per_page(10)
  end

  #view employees who are 18 or older  
  def older
      @employees = Employee.is_18_or_older.alphabetical.paginate(page: params[:page]).per_page(10)
  end
  
  #view only active employees
  def active
      @employees = Employee.for_store(current_user.employee.current_assignment.store_id).active.alphabetical.paginate(page: params[:page]).per_page(10)
  end

  #view inactive employees
  def inactive
      @employees = Employee.inactive.alphabetical.paginate(page: params[:page]).per_page(10)
  end
   
  #view employees only
  def regulars
      @employees = Employee.regulars.alphabetical.paginate(page: params[:page]).per_page(10)
  end
  
  #view managers only
  def managers
      @employees = Employee.managers.alphabetical.paginate(page: params[:page]).per_page(10)
  end

  #view admins only
  def admins
      @employees = Employee.admins.alphabetical.paginate(page: params[:page]).per_page(10)
  end
  
  # GET /employees/new
  def new
    @employee = Employee.new
    @user = @employee.build_user
    
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :ssn, :date_of_birth, :phone, :role, :active)
    end
end
