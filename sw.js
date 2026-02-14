// Service Worker - 캐싱으로 빠른 로딩
const CACHE_NAME = 'hogeon-mystery-v25';
const urlsToCache = [
  '/',
  '/index.html',
  '/games/hogeon/index.html',
  '/games/hogeon/story.json',
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
