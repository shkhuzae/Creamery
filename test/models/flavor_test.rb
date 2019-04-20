require 'test_helper'

class FlavorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_many(:store_flavors)
  should have_many(:stores).through(:store_flavors)
end
