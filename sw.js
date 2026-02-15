// Service Worker - 캐싱으로 빠른 로딩 + 업데이트 안정화(모바일 대응)
const CACHE_NAME = 'hogeon-mystery-v56';

// NOTE: GitHub Pages에서는 쿼리스트링이 붙어도 동일 리소스를 서빙함
//       (story.json?v=...) 형태를 함께 캐싱하면, 모바일에서 구버전 고착을 줄일 수 있음
const urlsToCache = [
  '/',
  '/index.html',
  '/CHANGELOG.md',
  '/games/hogeon/index.html',
  '/games/hogeon/story.json',
  '/games/hogeon/story.json?v=4.5',

  // images
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

  // sounds
  '/sounds/dark-fog-bgm.mp3',
  '/sounds/investigation-old.mp3',
  '/sounds/mystery-new.mp3',

  // external
  'https://unpkg.com/inkjs@2.3.0/dist/ink.js'
];

self.addEventListener('install', (event) => {
  event.waitUntil(
    (async () => {
      const cache = await caches.open(CACHE_NAME);

      // 한 파일 실패로 전체 install이 깨지지 않게(모바일/불안정 네트워크 대응)
      await Promise.allSettled(
        urlsToCache.map((url) => cache.add(url))
      );

      // 새 SW를 즉시 활성화
      await self.skipWaiting();
    })()
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    (async () => {
      const keys = await caches.keys();
      await Promise.all(
        keys
          .filter((key) => key !== CACHE_NAME)
          .map((key) => caches.delete(key))
      );

      // 열린 탭에도 즉시 적용
      await self.clients.claim();
    })()
  );
});

function cacheFirst(request) {
  return caches.match(request).then((cached) => cached || fetch(request));
}

function networkFirst(request) {
  return fetch(request)
    .then((response) => {
      // same-origin 성공 응답은 런타임 캐시에 저장
      try {
        const url = new URL(request.url);
        if (url.origin === self.location.origin && response && response.ok) {
          caches.open(CACHE_NAME).then((cache) => cache.put(request, response.clone()));
        }
      } catch (_) {
        // ignore
      }
      return response;
    })
    .catch(() => caches.match(request));
}

self.addEventListener('fetch', (event) => {
  // GET만 캐싱
  if (event.request.method !== 'GET') return;

  const url = new URL(event.request.url);

  // HTML / story.json은 업데이트가 중요하므로 network-first
  const isHTML = event.request.mode === 'navigate' || url.pathname.endsWith('.html');
  const isStoryJSON = url.pathname === '/games/hogeon/story.json';
  const isChangelog = url.pathname === '/CHANGELOG.md';

  if (url.origin === self.location.origin && (isHTML || isStoryJSON || isChangelog)) {
    event.respondWith(networkFirst(event.request));
    return;
  }

  // 나머지는 cache-first
  event.respondWith(cacheFirst(event.request));
});
