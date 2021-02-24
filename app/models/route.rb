class Route < ApplicationRecord
  belongs_to :truck
  has_many :route_members
end
