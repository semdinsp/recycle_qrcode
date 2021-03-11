# HOw to add information to google map

## Admin interface
URL/admin/entities  See [demo admin](https://grcode-staging.herokuapp.com)

## QR Codes
The entities [entity](https://qrcode-staging.herokuapp.com/admin/entities/d8ea2f31-c145-4ac5-9ac3-59baa85b330c) each have a bar code in them.  You can print the bar code and attach it to an object and when people scan the bar code it will track the activity.  So for example we can track collections at a bin but you could also track processing at an assembly line or any other process.

## Key Value Pairs

The system has an object type named key value pair. These key value pairs can store semi structured data for the following keys (contact, telephone, notes and suco).

## Basic information

Basic information assigned to an entity (bin) is displayed on the googlemap.

## Suco

When you set a suco key value then it is appended to the site name in Google maps.  So the site name will appear in a bubble in brackets when you click on the google marker.  [map](https://maps.verde-tl.com)

## GPS Distances

Calculated via haversine formula between two locations.  Locations.rb has the code for this.
