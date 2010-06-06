$(document).ready(function () {
    var options = {
        zoom: 12,
        center: new google.maps.LatLng(12.95945073019842, 77.64325065040589),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControl: false
    };
    var map = new google.maps.Map(document.getElementById('map'), options);

    showMarkerAt(map, 12.958886129203817, 77.64345449829102);

    $.ajax({
        url: '/people/all',
        type: 'GET',
        success: function(data, status, xhr) {
            $.each(data, function (key, location) {
                showMarkerAt(map, location['location']['lat'], location['location']['lng']);
            });
        },
        error: function(xhr) {
            alert("Crap! Call 9013324771");
        }
    });

});

function showMarkerAt(map, lat, lng) {
    var marker = new google.maps.Marker({
        map: map,
        title: 'Banagalore ONE',
        position: new google.maps.LatLng(lat, lng)
    });
    marker.setVisible(true);
}
;
