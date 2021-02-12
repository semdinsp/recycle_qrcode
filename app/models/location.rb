class Location < ApplicationRecord
  belongs_to :entity
  belongs_to :actiontype, optional: true
end
