// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

import "channels"
require("bootstrap");
require("@fortawesome/fontawesome-free");

Rails.start()
Turbolinks.start()
ActiveStorage.start()
import "controllers"

function initMap()  {
  //console.log("in initmap");
  var center, infowindow, map;
  center = {
    lat: -8.5569,
    lng: 125.5603    };
  map = new google.maps.Map($('#map')[0], {
    zoom: 12,
    center: center
  });
  infowindow = new google.maps.InfoWindow;
  return $.getJSON('/bins.json', function(jsonData) {
    return $.each(jsonData, function(key, data) {
      var latLng, marker,iconurl;
      latLng = new google.maps.LatLng(data.lat, data.lng);
      iconurl= "https://maps.google.com/mapfiles/ms/icons/"+data.iconcolor + "-dot.png";
      marker = new google.maps.Marker({
        position: latLng,
        map: map,
        icon: { url: iconurl},
        title: data.title
      });
      return google.maps.event.addListener(marker, 'click', function() {
        infowindow.setOptions({
          content: data.content,
          maxWidth: 300
        });
        return infowindow.open(map, marker);
      });
    });
  });
};

$(document).on('turbolinks:load', function() {
  console.log("start of turboLinks:load");
  initMap();
});
