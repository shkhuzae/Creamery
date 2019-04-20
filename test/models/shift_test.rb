require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to(:assignment)
  should have_many(:shift_jobs)
  should have_many(:jobs).through(:shift_jobs)
  should have_one(:employee).through(:assignment)
  should have_one(:store).through(:assignment)

  should allow_value(Time.now).for(:start_time)
  should allow_value(1.hour.from_now).for(:start_time)
  should allow_value(2.hours.ago).for(:start_time)
  should_not allow_value("fred").for(:start_time)
  should_not allow_value(3.14159).for(:start_time)
  should_not allow_value(nil).for(:start_time)

  should validate_presence_of(:date)
  should validate_presence_of(:start_time)
  should validate_presence_of(:assignment_id)
  
  context "Creating a context for shifts" do
    setup do 
      create_stores
      create_employees
      create_assignments
      create_shifts
    end
    
    teardown do
      remove_stores
      remove_employees
      remove_assignments
      remove_shifts
    end
    
    
    should "have a completed method" do
      assert_equal false, @ed_past_shift2.completed?
    end

    should "have a callback which sets end time to three hours on create, but not on update" do
      # end_time is set on create
      @shift_kj_good = FactoryBot.create(:shift, assignment: @assign_kathryn, start_time: Time.local(2000,1,1,14,0,0), end_time: nil)
      assert_equal "17:00:00", @shift_kj_good.end_time.strftime("%H:%M:%S")
      # end_time is left alone on update
      assert_equal "14:00:00", @kathryn_shift1.end_time.strftime("%H:%M:%S")
      @kathryn_shift1.notes = "She did a good job today."
      @kathryn_shift1.start_time = Time.local(2000,1,1,12,0,0)
      @kathryn_shift1.save!
      assert_equal "14:00:00", @kathryn_shift1.end_time.strftime("%H:%M:%S")
    end
    
     # test start_now method
    should "have start_now method that updates database" do 
      @ben_shift1.start_now
      @ben_shift1.reload
      date_shift = Time.current - Time.local(2000,1,1,0,0,0)
      assert_in_delta(Time.current.to_i - date_shift, @ben_shift1.end_time.in_time_zone.to_i, 50000)
    end

    # test end_now method
    should "have end_now method that updates database" do 
      @ben_shift1.end_now
      @ben_shift1.reload
      date_shift = Time.current - Time.local(2000,1,1,0,0,0)
      assert_in_delta(Time.current.to_i - date_shift, @ben_shift1.end_time.in_time_zone.to_i, 50000)
    end
    
  end
end
