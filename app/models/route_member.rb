class RouteMember < ApplicationRecord
  acts_as_list
  belongs_to :route
  belongs_to :entity
  
end
