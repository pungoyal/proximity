window.onload = function() {
    var options = {
        zoom: 6,
        center: new google.maps.LatLng(5.8, 1.0),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControl: false
    };
    var map = new google.maps.Map(document.getElementById('map'), options);
}