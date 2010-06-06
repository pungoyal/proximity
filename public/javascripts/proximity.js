$(document).ready(function () {
    var options = {
        zoom: 13,
        center: new google.maps.LatLng(12.95945073019842, 77.64325065040589),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControl: false
    };
    var map = new google.maps.Map(document.getElementById('map'), options);

    var marker = new google.maps.Marker({
        map: map,
        title: 'Marker #',
        position: new google.maps.LatLng(12.971606, 77.594376),
        draggable: true
    });
    marker.setVisible(true);
});                                           