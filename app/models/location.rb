# This is a polymorphic class so that both entities and actiontypes are locatable
# it supports latitude longitude and Accuracy
# generally it is updated during the checkin_location_set command and created for most objects
# function haversine_distance calculated distance from another location
# @author Scott Sproule

class Location < ApplicationRecord
  #belongs_to :entity  SCOTT CHECK
  belongs_to :locatable, polymorphic: true
  # convert old location stuff to locatable   ... Location.all.each { |l| e=Entity.find(l.entity_id); e.location=l; e.save; l.save }

def latLng
  return "#{self.latitude} : #{self.longitude}"
end

def latLngShort
  return "not set" if self.longitude.nil? or self.latitude.nil?
  len=3  # was 2
  return "#{self.latitude.round(len)} : #{self.longitude.round(len)}"
end

def self.create_from_params(params,parent)
   loc=Location.new
   loc.latitude=params['latitude']
   loc.longitude=params['longitude']
   loc.accuracy=params['accuracy']
   parent.location=loc
   res=loc.save!
   raise "could not create location #{loc.inspect} #{loc.errors.inspect}" if !res
   loc
end

# calculate distance between two GPS lat/long points
# using formual derived from movabletype website
# @param alocation  - another loation
# @param miles - result in miles or km (default)

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
