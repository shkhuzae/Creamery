class ShiftJob < ApplicationRecord
    # relationships
  belongs_to :shift
  belongs_to :job
end
