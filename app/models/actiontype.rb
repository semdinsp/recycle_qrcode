class Actiontype < ApplicationRecord
  belongs_to :entity
  has_one :location
  enum atype: [  :collection, :departure, :arrival ]
end
