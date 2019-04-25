require 'test_helper'

class JobTest < ActiveSupport::TestCase

  #testing relationships
  should have_many(:shift_jobs)
  should have_many(:shifts).through(:shift_jobs)
  
  #presence of name
  should validate_presence_of(:name)
  
  #testing scopes
  context "Creating a context for jobs" do
    # create the objects I want with factories
    setup do 
      create_jobs
    end
    
    # and provide a teardown method as well
    teardown do
      remove_jobs
    end
    
     # test the scope 'alphabetical'
    should "show that there are three jobs in alphabetical order" do
      assert_equal ["Cashier", "Cleaning", "Mopping", "Washing"], Job.alphabetical.map{|j| j.name}
    end
    
    # test the scope 'active'
    should "show that there are three active jobs" do
      assert_equal 3, Job.active.size
    end
    
    # test the scope 'active'
    should "show that there is one inactive job" do
      assert_equal 1, Job.inactive.size
    end
    
    
  end
end
