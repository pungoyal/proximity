window.onload = function() {
    var latlng = new google.maps.LatLng(5.8, 1.0);
    var options = {
        zoom: 6,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById('map'), options);
}