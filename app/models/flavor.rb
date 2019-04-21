class Flavor < ApplicationRecord
  # Relationships
  has_many :store_flavors
  has_many :stores, through: :store_flavors
  
  validates_presence_of :name
  
  # Scopes
  scope :alphabetical, -> { order('name') }
  scope :active,       -> { where(active: true) }
  scope :inactive,     -> { where(active: false) }
  
  # Callbacks
  before_destroy :is_destroyable?
  after_rollback :convert_to_inactive

  private
  def is_destroyable?
    @destroyable = false
  end
  
  def convert_to_inactive
    make_inactive if !@destroyable.nil? && @destroyable == false
    @destroyable = nil
  end

  def make_inactive
    self.update_attribute(:active, false)
  end
  
end
