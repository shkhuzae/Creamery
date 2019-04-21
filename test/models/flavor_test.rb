require 'test_helper'

class FlavorTest < ActiveSupport::TestCase
  #testing relationships
  should have_many(:store_flavors)
  should have_many(:stores).through(:store_flavors)
  
  #validation
  should validate_presence_of(:name)
  
  #testing scopes
  context "Creating a context for flavors" do
    # create the objects I want with factories
    setup do 
      create_flavors
    end
    
    # and provide a teardown method as well
    teardown do
      remove_flavors
    end
    
     # test the scope 'alphabetical'
    should "show that there are three flavors in alphabetical order" do
      assert_equal ["Chocolate", "Jamoca", "Mint", "Strawberry", "Vanilla"], Flavor.alphabetical.map{|j| j.name}
    end
    
    # test the scope 'active'
    should "show that there are three active flavors" do
      assert_equal 3, Flavor.active.size
    end
    
    # test the scope 'active'
    should "show that there is one inactive flavor" do
      assert_equal 2, Flavor.inactive.size
    end
    
    
  end
end
