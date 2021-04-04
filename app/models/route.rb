# Route is the route for the truck to go on a given day.
# We link the route to route memembers so bins can be part of numerours routes
# RAIL 6 Polymorphic has_many issue/ bug  /error.
# I need to add the class_name field to the has_many polymorphic as: so that the
# has_many started to work.  
# @author Scott Sproule

class Route < ApplicationRecord
  belongs_to :truck
  has_many :route_members
  has_many :actionevents, as: :trackable, class_name: "Actiontype"

end
