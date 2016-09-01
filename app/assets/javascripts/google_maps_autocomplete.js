$(document).ready(function() {
  var booking_location = $('#booking_location').get(0);

  if (booking_location) {
    var autocomplete = new google.maps.places.Autocomplete(booking_location, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(booking_location, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

function onPlaceChanged() {
  var place = this.getPlace();
  var components = getLocationComponents(place);

  $('#booking_location').trigger('blur').val(components.location);
  $('#booking_zip_code').val(components.zip_code);
  $('#booking_city').val(components.city);
  if (components.country_code) {
    $('#booking_country').val(components.country_code);
  }
}


