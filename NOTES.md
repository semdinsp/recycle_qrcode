# How to add points to google map and QR Code functionality

## Admin interface
URL/admin/entities  See [demo admin](https://qrcode-staging.herokuapp.com/admin/entities)

## QR Codes
The entities [entity](https://qrcode-staging.herokuapp.com/admin/entities/d8ea2f31-c145-4ac5-9ac3-59baa85b330c) each have a bar code in them.  You can print the bar code and attach it to an object and when people scan the bar code it will track the activity.  So for example we can track collections at a bin but you could also track processing at an assembly line or any other process.

### checkin
The checkin qr code allows someone to perform an action on the entity at a location.  We use the term checkin to record a collection of a bin but conceptually it could be anything.

In our usage, we print the qr code and attach the printout to the bin.  The driver scans the qr code when he does the collection.  We capture the location of the phone during this process. (obviously phone can have location services disabled to prevent this)

### update location
There is a qr code in the admin section to update the bin/entity location in the system automatically.  The use case is the bin needs to be moved then someone goes to the bin and moves it.  When the move is complete she scans the update location qr code with location services enabled.  The bin/entity location will be updated in the back end database.  The system provides a map link where you can check the new location.

## Key Value Pairs

The system has an object type named key value pair. These key value pairs can store semi structured data for the following keys (contact, telephone, notes and suco).

## Basic information

Basic information assigned to an entity (bin) (kv_pair info) is displayed on the googlemap icon.

## Suco (District)

When you set a suco key value then it is appended to the site name in Google maps.  So the site name will appear in a bubble in brackets when you click on the google marker.  [map](https://qrcode-staging.herokuapp.com)

## GPS Distances

Calculated via haversine formula between two locations.  Locations.rb has the code for this.
