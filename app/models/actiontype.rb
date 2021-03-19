class Actiontype < ApplicationRecord
  self.implicit_order_column = "created_at"

  belongs_to :entity
  has_one :location, as: :locatable, dependent: :destroy
  enum atype: [  :collection, :departure, :arrival ]
  scope :recent, -> { order('created_at DESC').limit(1) }
  scope :thisMonth, -> { where('created_at > :ts', ts: Time.now.all_month.first)}
  def recent_activity
    self.today?
  end
  def today?
    self.created_at > Time.now - 1.day
  end
  # bit of a kludge here
  # return something in future
  def routeposition
    ""
  end
  def name
    self.atype
  end
  def yesterday?
    return false if self.today?
    return true if self.created_at > Time.now - 2.day
    false
  end

def self.create_checkin

end


end
