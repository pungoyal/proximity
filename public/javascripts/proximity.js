window.onload = function() {
    var latlong = new google.maps.LatLng(5.8, 1.0);
    var options = {
        zoom: 6,
        center: latlong,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControl: false,
        navigationControlOptions: {
            style: google.maps.NavigationControlStyle.DEFAULT
        }
    };
    var map = new google.maps.Map(document.getElementById('map'), options);
}