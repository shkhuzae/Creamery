class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  authorize_resource
  
  # GET /shifts
  # GET /shifts.json
  def index
    @shifts = Shift.all
    @shiftsmanager =  Shift.where(assignment_id: Assignment.for_store(current_user.employee.current_assignment.store_id))
  end

  def by_store
      @shifts = Shift.by_store.chronological.paginate(page: params[:page]).per_page(10)
  end
  
  def by_employee
      @shifts = Shift.by_employee.chronological.paginate(page: params[:page]).per_page(10)
  end
  
  def past
    @shifts = Shift.past.chronological.paginate(page: params[:page]).per_page(10)
  end
 
  def upcoming
    @shifts = Shift.upcoming.chronological.paginate(page: params[:page]).per_page(10)
  end 

  def completed
    @shifts = Shift.completed.chronological.paginate(page: params[:page]).per_page(10)
  end
  
  def incomplete
    @shifts = Shift.incomplete.chronological.paginate(page: params[:page]).per_page(10)
  end
  
  # GET /shifts/1
  # GET /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts
  # POST /shifts.json
  def create
    @shift = Shift.new(shift_params)

    respond_to do |format|
      if @shift.save
        format.html { redirect_to @shift, notice: 'Shift was successfully created.' }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_url, notice: 'Shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_params
      params.require(:shift).permit(:assignment_id, :date, :start_time, :end_time, :notes)
    end
end
