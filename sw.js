// Service Worker - 캐싱으로 빠른 로딩
const CACHE_NAME = 'hogeon-mystery-v44';
const urlsToCache = [
  '/',
  '/index.html',
  '/games/hogeon/index.html',
  '/games/hogeon/story.json',
  '/games/hogeon/images/prologue.png',
  '/games/hogeon/images/ending_lotto.png',
  '/games/hogeon/images/ending_ship.png',
  '/games/hogeon/images/ending_hospital.png',
  '/games/hogeon/images/ending_witness.png',
  '/games/hogeon/images/ending_isekai.png',
  '/games/hogeon/images/ending_spy.png',
  '/games/hogeon/images/ending_religion.png',
  '/games/hogeon/images/ending_business.png',
  '/games/hogeon/images/ending_overseas.png',
  '/sounds/dark-fog-bgm.mp3',
  '/sounds/investigation-old.mp3',
  '/sounds/mystery-new.mp3',
  'https://unpkg.com/inkjs@2.3.0/dist/ink.js'
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(urlsToCache))
  );
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => response || fetch(event.request))
  );
});
