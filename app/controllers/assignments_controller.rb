class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  def current
      @assignments = Assignment.current.chronological.paginate(page: params[:page]).per_page(10)
  end
    
  def past
      @assignments = Assignment.past.chronological.paginate(page: params[:page]).per_page(10)
  end

  def by_store
      @assignments = Assignment.by_store.chronological.paginate(page: params[:page]).per_page(10)
  end    

  def by_employee
      @assignments = Assignment.by_employee.chronological.paginate(page: params[:page]).per_page(10)
  end     

  def for_store
      @assignments = Assignment.for_store(store_id).chronological.paginate(page: params[:page]).per_page(10)
  end
  
  def for_employee
      @assignments = Assignment.for_employee(employee_id).chronological.paginate(page: params[:page]).per_page(10)
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:store_id, :employee_id, :start_date, :end_date, :pay_level)
    end
end
