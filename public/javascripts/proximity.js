$(document).ready(function () {
    var options = {
        zoom: 13,
        center: new google.maps.LatLng(12.95945073019842, 77.64325065040589),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControl: false
    };
    var map = new google.maps.Map(document.getElementById('map'), options);
    showMarkerAt(map, 12.958886129203817, 77.64345449829102);
    showMarkerAt(map, 12.9335426, 77.6292697);
});

function showMarkerAt(map, lat, lng) {
    var b1 = new google.maps.Marker({
        map: map,
        title: 'Banagalore ONE',
        position: new google.maps.LatLng(lat, lng)
    });
    b1.setVisible(true);
};
