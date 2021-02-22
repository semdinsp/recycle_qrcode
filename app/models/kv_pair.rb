class KvPair < ApplicationRecord
  belongs_to :entity
  enum key: [  :contact, :telephone, :address, :notes ]

end
