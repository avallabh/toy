// Note: This requires that you consent to location sharing when
// prompted by your browser. If you see a blank space instead of the map, this
// is probably because you have denied permission for location sharing.

// 42.3516303  - LAT
// -71.0614178 - LONG
var map;
var marker;

function initialize() {
  var mapOptions = {
    zoom: 19
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);

  // Try HTML5 geolocation
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude,
       position.coords.longitude);

      var infowindow = new google.maps.InfoWindow({
        map: map,
        position: pos,
        content: 'Current location.'
      });

      map.setCenter(pos);
    }, function() {
      handleNoGeolocation(true);
    });
  } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }

  // adds markers onClick
  google.maps.event.addListener(map, 'click', function(event) {
    latitude = event.latLng.lat();
    longitude = event.latLng.lng();
    console.log( latitude + ', ' + longitude ); // outputs lat/long to console for testing
    $('#restroom_latitude').val(latitude);
    $('#restroom_longitude').val(longitude);
    placeMarker(event.latLng);
  });
}

function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(60, 105),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}

// place markers on map
function placeMarker(location) {
  if (marker) { marker.setPosition(location);
  } else {
    marker = new google.maps.Marker({
      position: location,
      map: map
    });
  }
  // var marker; = new google.maps.Marker({
  //   position: location,
  //   map: map
  // });
}

// loads map with geolocation
google.maps.event.addDomListener(window, 'load', initialize);
