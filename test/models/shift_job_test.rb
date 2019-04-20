require 'test_helper'

class ShiftJobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to(:shift)
  should belong_to(:job)
end
