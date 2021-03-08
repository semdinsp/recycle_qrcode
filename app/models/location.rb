class Location < ApplicationRecord
  #belongs_to :entity  SCOTT CHECK
  belongs_to :locatable, polymorphic: true
  # convert old location stuff to locatable   ... Location.all.each { |l| e=Entity.find(l.entity_id); e.location=l; e.save; l.save }

def latLng
  return "#{self.latitude} : #{self.longitude}"
end
end
