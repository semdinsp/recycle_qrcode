class Location < ApplicationRecord
  #belongs_to :entity  SCOTT CHECK
  belongs_to :locatable, polymorphic: true
  # convert old location stuff to locatable   ... Location.all.each { |l| e=Entity.find(l.entity_id); e.location=l; e.save; l.save }

def latLng
  return "#{self.latitude} : #{self.longitude}"
end

def latLngShort
  return "not set" if self.longitude.nil? or self.latitude.nil?
  return "#{self.latitude.round(2)} : #{self.longitude.round(2)}"
end

def haversine_distance(alocation, miles=false)
  # Get latitude and longitude
  res=100000.0
  lat1 =  self.latitude
  lon1 =  self.longitude
  if !alocation.nil?

      lat2 = alocation.latitude
      lon2 = alocation.longitude

      # Calculate radial arcs for latitude and longitude
      dLat = (lat2 - lat1) * Math::PI / 180
      dLon = (lon2 - lon1) * Math::PI / 180


      a = Math.sin(dLat / 2) *
          Math.sin(dLat / 2) +
          Math.cos(lat1 * Math::PI / 180) *
          Math.cos(lat2 * Math::PI / 180) *
          Math.sin(dLon / 2) * Math.sin(dLon / 2)

      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

      d = 6371 * c * (miles ? 1 / 1.6 : 1)
      res=d
    end
  res
end

end
