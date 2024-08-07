'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "7e4fb78f9b0c9cf2cb2309f26c31874a",
"version.json": "eb2d0c181a1815dce3368079dec1c0e6",
"index.html": "262b754dc95c88ba96ffccfcaddd7561",
"/": "262b754dc95c88ba96ffccfcaddd7561",
"main.dart.js": "bfffc79ab1a5e2623d43eb77d03e861c",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "94ade96aad13d9e20e2c7c376d0dc0ab",
"assets/AssetManifest.json": "ff4947b3ee060bdf406e8190a358bcb6",
"assets/NOTICES": "035661059c4fee4647fbd3039bde2377",
"assets/FontManifest.json": "7fea307b8fece3cf0dd209c2591365e3",
"assets/AssetManifest.bin.json": "5d5baf1bcf31ccae518cd3db41b8ebad",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "c9c6d4b696e9329194d31f0f3cd83094",
"assets/fonts/MaterialIcons-Regular.otf": "6bfe87097264340d89d9125fda3ac1db",
"assets/assets/images/Murshed_Abwaab.svg": "dbf7ccf63ae1ad584eb7c9ae5c2ee8fa",
"assets/assets/images/Abwaab_Logo2.png": "1850c3337438e4c6092506b9ceabdf84",
"assets/assets/images/play_video.svg": "361a2f6f79720cd256f56c990565a003",
"assets/assets/images/Down.svg": "c921b898adae67580666dab5933f2dc4",
"assets/assets/images/wrong_icon.svg": "87d084e2129618224b63fb6abf1aff16",
"assets/assets/images/drag.svg": "784d10f882a5f5beb361fd3e0cd291c9",
"assets/assets/images/maths.png": "09c43ccb02c0169dcb6053337dd8f623",
"assets/assets/images/arabic.svg": "b7d940e72f6c874ecc5f9c54bef27e3c",
"assets/assets/images/arabic.png": "3372a5fbb5368f6dda384e55a627dc3b",
"assets/assets/images/calender.svg": "ed7c6043783fec615f3904d023465c70",
"assets/assets/images/maths.svg": "db780dd5ebd2ace67eaed845765058e8",
"assets/assets/images/profile_icon.svg": "8d60f539e7144fc2d25eac097c9c475d",
"assets/assets/images/all_materials_icon.svg": "43667c6d1cf06517e51340473c0c1c25",
"assets/assets/images/Abwaab_Logo2.svg": "94b7ced1e9e6e30f53d193ceb7bf42d2",
"assets/assets/images/Murshed_Abwaab.png": "e321eb8884e208e87eb9df71e7123276",
"assets/assets/images/Info.svg": "a161fa26b3a1d8ed02ea09ce3ce4349e",
"assets/assets/images/Close.svg": "965622fd9fdc0c0b20dc2cdde265b907",
"assets/assets/images/forward_courses_list.svg": "88d10a3bc19a1ff3f4a69ffe7012c5b1",
"assets/assets/images/qa_icon.svg": "4d2099489aceb98c403cfe241b585fa4",
"assets/assets/images/Union.svg": "41313333b5a2fa143d5e167c164d5627",
"assets/assets/images/blue_avg_icon.svg": "bbe69fa55375d1d5cf6198480c377da2",
"assets/assets/images/murshed_abwaab_logo.svg": "42dbef462006c2efc250140f748efdbb",
"assets/assets/images/PDF.svg": "bcb06d2d5bf40c1b77a59ee29be7f29e",
"assets/assets/images/PasswordView.svg": "02640492572406b315d2ef78b84f858a",
"assets/assets/images/Android_Right.svg": "19faf858aac7b3e7b457497c97a05f36",
"assets/assets/images/Success.svg": "c00cb8b822fc70c815f9fd921b49a8ba",
"assets/assets/images/Dawood.png": "536ba4919198e141ae6cb69d8d3f8f39",
"assets/assets/images/Union.png": "28c19186e1ffd60a2121ab5829287ffc",
"assets/assets/images/scrolling_shadow.svg": "e2cea9f6bd10be11e1c673fdeeb0bab6",
"assets/assets/images/Left.svg": "2fd8fd3c183fdaf15af29dd775651c34",
"assets/assets/images/Test.svg": "70cb28d4c722d57ea1f848da5bb50244",
"assets/assets/images/avg_icon.svg": "e8a8fa2772445c367c8f5b63b4b82997",
"assets/assets/fonts/Dubai-Medium.ttf": "1b70cb9a589df286a5e4faf70e2a50d9",
"assets/assets/fonts/Dubai-Regular.ttf": "24ab51f6ae1804c808f822d28b9be18a",
"assets/assets/fonts/Dubai-Light.ttf": "2f7c5bb9cf55f5b0cb2d06c57d5a8ae7",
"assets/assets/fonts/Dubai-Bold.ttf": "8fbdda63d87a91c5600c512a12aec79a",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
