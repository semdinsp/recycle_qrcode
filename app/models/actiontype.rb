class Actiontype < ApplicationRecord
  belongs_to :entity
  has_one :location
  enum atype: [  :collection, :departure, :arrival ]
  scope :recent, -> { order('created_at DESC').limit(1) }

  def recent_activity
    self.created_at > Time.now - 1.day
  end

def self.create_checkin

end


end
