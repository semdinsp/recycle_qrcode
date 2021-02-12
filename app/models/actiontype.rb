class Actiontype < ApplicationRecord
  belongs_to :entity
  belongs_to :location
  enum atype: [ :collection, :departure, :arrival ]

end
