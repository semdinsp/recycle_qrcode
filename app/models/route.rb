class Route < ApplicationRecord
  belongs_to :truck
  has_many :route_members
  has_many :events, as: :trackable

end
