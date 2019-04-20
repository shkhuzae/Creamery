require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_many(:shift_jobs)
  should have_many(:shifts).through(:shift_jobs)
end
