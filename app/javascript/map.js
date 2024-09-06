import Map from 'ol/Map';
import View from 'ol/View';
import TileLayer from 'ol/layer/Tile';
import XYZ from 'ol/source/XYZ';
import { Overlay } from 'ol';
import { toLonLat } from 'ol/proj.js';

let map;

document.addEventListener('turbo:load', function () {

  // Popup Overlay
  const container = document.getElementById('popup');

  const overlay = new Overlay({
    element: container,
    autoPan: {
      animation: {
        duration: 250,
      },
    },
  });

  map = new Map({
    target: 'map',
    layers: [
      new TileLayer({
        source: new XYZ({
          url: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'
        })
      })
    ],
    overlays: [overlay],
    view: new View({
      center: [0, 0],
      zoom: 2
    })
  });


  map.on('singleclick', function (evt) {
    const coordinate = evt.coordinate;
    const [lon, lat] = toLonLat(coordinate)
    
    const url = new URL('/map_data', window.location.origin);
    url.searchParams.append('lat', lat);
    url.searchParams.append('lon', lon);

    fetch(url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html",
      },
    })
      .then(r => r.text()) //Get HTML
      .then(html => Turbo.renderStreamMessage(html)) //Render HTML w/ stream, should update popup-content
      .then(r => overlay.setPosition(coordinate)) // Reveal overlay as popup
  });
});


