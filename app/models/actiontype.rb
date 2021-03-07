class Actiontype < ApplicationRecord
  self.implicit_order_column = "created_at"

  belongs_to :entity
  has_one :location, as: :locatable, dependent: :destroy
  enum atype: [  :collection, :departure, :arrival ]
  scope :recent, -> { order('created_at DESC').limit(1) }

  def recent_activity
    self.today?
  end
  def today?
    self.created_at > Time.now - 1.day
  end
  def yesterday?
    return false if self.today?
    return true if self.created_at > Time.now - 2.day
    false
  end

def self.create_checkin

end


end
