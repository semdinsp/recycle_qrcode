# QRCode Tracking of Recycle Collection (semdinsp/recycle_qrcode)
[Github](https://github.com/semdinsp/recycle_qrcode)

## Simple database driven system to monitor collections/activity at various locations and display status on a google map.
In our particular case we use it for collecting recycled plastic from our collection bins.  The driver at the collection vehicle scans the qr code for the site to track a collection and the database is updated with the collection time stamp.    We support reports and a live google map to track collection status.  Each entity (collection point) can associate data with it via key value pairs.  YOu can drag and drop the collection routes

Feel free to drop me a note on how to migrate this system to track other items (eg security guard scans via QR code or package tracking or ...)

# Yard Command
yardoc --no-private --protected app/**/*.rb - README LEGAL COPYING NOTES.md

# To do
  * additional reporting (currently a private google data studio web page links to the data)
  * security/authentication (jwt)
  * fix icon color display code to make it more scalable
  * add links to return from route pages  (where should they go)
  * add index on route member entity.
  * map of collections for a bin
  * track routes
  * add additional indices  (particularly for kv pairs on entity id and same for entity id in locations) -DONE
  * route editing and displays (for truck routes) -SEMI DONE
  * add locatable polymorphic class for locations so that both entity and actiontype have the same type of location -DONE
  * add route item and link route item and entity. -SEMI DONE
  * setting object  (for various configurations and a center for google map)- DONE


## Installation
  * needs postgres database  see database.yml
  * run all the migrations
  * remember to run rails db:seed to create startup Settings  (in theory this can be run a few times as it will skip created data)

## Demo
Please visit the staging server as a  [Demo](https://qrcode-staging.herokuapp,com).  It is running a free tier on heroku (and is the staging server so it should be upto date) so it takes about 30 seconds to spin up but should be responsive after you start it.  The staging server has the map centered on Dili Timor Leste but also has a few test points in Singapore.  So you need to adjust the scroll to see the sites.


## Documentation
Please see the [documentation](https://docs.verde-tl.com).  The documentation is hosted on netlify and generated via Yard.

## Startup
It is currently configured to support heroku using the falcon web server.  It is also configured to support puma (commented out).  Start up for either webserver is as simple (see the Procfile).  On first startup locally you probably need to run rake db:migrate and fiddle with rails credentials.
  * bundle exec falcon host
  * bundle exec puma config.ru  -C ./config/puma.rb

Basic url should bring up google map.  Admin page is located on collection page or via url/admin/entities
