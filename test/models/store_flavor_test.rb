require 'test_helper'

class StoreFlavorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to(:store)
  should belong_to(:flavor)
end
