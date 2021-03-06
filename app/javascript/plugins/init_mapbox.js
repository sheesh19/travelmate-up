import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
    const mapElement = document.getElementById('map');

    const fitMapToMarkers = (map, markers) => {
        const bounds = new mapboxgl.LngLatBounds();
        markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
        map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 });
    };

    if (mapElement) { // only build a map if there's a div#map to inject into
        mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/sheesh19/ckpuew8132h3d17n387mmg5jn'
            // style: 'mapbox://styles/sheesh19/ckj0j64ts1lnx19nxdnxqycyq'
        });

        const markers = JSON.parse(mapElement.dataset.markers);

        markers.forEach((marker) => {
            new mapboxgl.Marker()
                .setLngLat([marker.lng, marker.lat])
                .addTo(map);
        });

        fitMapToMarkers(map, markers);
    }
};

export { initMapbox };
