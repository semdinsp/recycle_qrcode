class Actiontype < ApplicationRecord
  self.implicit_order_column = "created_at"

  belongs_to :entity
  has_one :location, as: :locatable, dependent: :destroy
  enum atype: [  :collection, :departure, :arrival, :start_route, :close_route ]
  scope :recent, -> { order('created_at DESC').limit(1) }
  scope :collected, -> {where('atype = :t1',t1: Actiontype.atypes[:collection])}
  scope :thisMonth, -> { where('created_at > :ts', ts: Time.now.all_month.first)}
  scope :lastMonth, -> { where('created_at > :ts1 and created_at < :ts2',
    {ts1: Time.now.last_month.all_month.first, ts2: Time.now.last_month.all_month.last})}
  belongs_to :trackable, polymorphic: true
  #def polymorphic_name
  #  Actiontype
  #end

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

def self.route_event(route,atype)
  raise "wrong type of event" if ![:start_route,:close_route].include?(atype)
  at=Actiontype.new
  at.atype=atype
  at.trackable=at
  at.entity=Entity.first  #TODO FIX this
  route.actionevents << at
  at.save
  route.save
  at
end

end
