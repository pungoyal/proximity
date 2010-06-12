$(document).ready(function () {
    $('.radio').attr('checked', true);

    var options = {
        zoom: 12,
        center: new google.maps.LatLng(12.95945073019842, 77.64325065040589),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControl: false
    };
    var map = new google.maps.Map(document.getElementById('map'), options);

    $.ajax({
        url: '/people/all',
        type: 'GET',
        success: function(data, status, xhr) {
            $.each(data["people"], function (key, person) {
                people[key] = createPerson(map, person);
            });

            $.each(data["offices"], function (key, office) {
                offices[key] = createOffice(map, office);
            });
        },
        error: function(xhr) {
            alert("Crap! Call Puneet.");
        }
    });

    $('.submit').click(function() {
        if (center != null) {
            center.setVisible(false);
        }
        if (circle != null) {
            circle.setMap(null);
        }

        center = offices[$('.radio:checked').attr('id')];
        center.setVisible(true);

        circle = new google.maps.Circle({
            map: map,
            radius: parseInt($('#radius_').val())
        });
        circle.bindTo('center', center, 'position');
    });
});

function createPerson(map, person) {
    return new google.maps.Marker({
        map: map,
        title: person['name'],
        position: new google.maps.LatLng(person['lat'], person['lng']),
        zIndex: 1
    });
}

function createOffice(map, office) {
    return new google.maps.Marker({
        map: map,
        title: office['name'],
        position: new google.maps.LatLng(office['lat'], office['lng']),
        icon: '/images/chart.png',
        visible: false,
        zIndex: 10
    });
}

var people = {};
var offices = {};
var circle, center;