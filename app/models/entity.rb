class Entity < ApplicationRecord
     enum etype: [  :bin, :garage ]
     enum status: [  :active, :deleted ]
     has_one :location, required: false
     has_many :actiontypes
end
