# KV Pair defines the kv_pair data structure.  Kv_pair is a simple way to associate
# data with an entity. Currently is supports the following types of key value pairs
# As an entity has a has many relationship with kv_pair you can add an arbitry number of
# pairs to this data.  You can add new keys by adding a new enum type to the end of the array.
#
#  The suco or district is now displayed in the map if the suco exists as a key value pair.
#
#*:contact,
#*:telephone,
#*:address,
#*:notes,
#*:suco
# @author Scott Sproule


class KvPair < ApplicationRecord
  belongs_to :entity
  enum key: [  :contact, :telephone, :address, :notes, :suco ]   #i think you need to add keys to the end of this array

end
