class KvPair < ApplicationRecord
  belongs_to :entity
  enum key: [  :contact, :telephone, :address, :notes, :suco ]   #i think you need to add keys to the end of this array

end
