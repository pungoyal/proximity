$(document).ready(function () {
    var options = {
        zoom: 12,
        center: new google.maps.LatLng(12.95945073019842, 77.64325065040589),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControl: false
    };
    var map = new google.maps.Map(document.getElementById('map'), options);

    createCenter(map);

    $.ajax({
        url: '/people/all',
        type: 'GET',
        success: function(data, status, xhr) {
            $.each(data["people"], function (key, person) {
                showMarkerAt(map, person);
            });
            offices = data["offices"];
        },
        error: function(xhr) {
            alert("Crap! Call 9013324771");
        }
    });

    $('.submit').click(function() {
        var radius = $('#radius_').val();
        circle.setRadius(parseInt(radius));

        var center = $('')
    });
});

var offices;
var circle;
function createCenter(map) {
    var b1 = new google.maps.Marker({
        map: map,
        title: "Bangalore ONE",
        position: new google.maps.LatLng(12.958886129203817, 77.64345449829102),
        icon: '/images/chart.png',
        visible: true,
        zIndex: 10
    });
    b1.setVisible(true);

    circle = new google.maps.Circle({
        map: map,
        radius: 5000
    });
    circle.bindTo('center', b1, 'position');
}

function showMarkerAt(map, person) {
    var marker = new google.maps.Marker({
        map: map,
        title: person['name'],
        position: new google.maps.LatLng(person['lat'], person['lng']),
        visible: true,
        zIndex: 1
    });
}
