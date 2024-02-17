
	var mapContainer = document.getElementById('map'),
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 3
    };  

    var map = new kakao.maps.Map(mapContainer, mapOption); 
    var geocoder = new kakao.maps.services.Geocoder();

    geocoder.addressSearch(stadiumAddress, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="padding:5px;">길찾기 <button onclick="openRoute()">클릭</button></div>'
            });

            kakao.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map, marker);
            });

            map.setCenter(coords);
        } 
    });

    function openRoute() {
        var destination = encodeURIComponent("서울특별시 송파구 올림픽로 25");
        var url = `https://map.kakao.com/?eName=${destination}`;
        var popupOptions = 'width=550, height=650, scrollbars=no';
        window.open(url, '카카오지도 길찾기', popupOptions);
    }