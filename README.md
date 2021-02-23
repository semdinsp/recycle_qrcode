# recycle_qrcode
# README
## Simple database driven system to monitor collections/activity at various locations and display status on a google map.
In our particular case we use it for collecting recycled plastic from our collection bins.  The driver at the collection vehicle scans the qr code for the site to track a collection and the database is updated with the collection time stamp.    We support reports and a live google map to track collection status.  Each entity (collection point) can associate data with it via key value pairs.

Feel free to drop me a note on how to migrate this system to track other items (eg security guard scans QR code or package tracking or ...)

# To do
  * setting object  (for various configurations and a center for google map)
  * add additional indices  (particularly for kv pairs on entity id)
  * additional reporting (currently a private google data studio web page links to the data)
  * security/authentication (jwt
  * route editing and displays (for truck routes)


## Documentation
Please see the [documentation](https://docs.verde-tl.com).  The documentation is hosted on netlify and generated via Yard.

## Startup
It is currently configured to support heroku using the falcon web server.  It is also configured to support puma (commented out).  Start up for either webserver is as simple as the Procfile.  On first startup you probably need to run rake db:migrate and fiddle with rails credentials.
  * bundle exec falcon host
  * bundle exec puma config.ru  -C ./config/puma.rb
