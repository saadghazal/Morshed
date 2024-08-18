'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "3c515276889273b96cb8e4432417dcd6",
"version.json": "eb2d0c181a1815dce3368079dec1c0e6",
"index.html": "262b754dc95c88ba96ffccfcaddd7561",
"/": "262b754dc95c88ba96ffccfcaddd7561",
"main.dart.js": "bb250760e28c10e6eacfd03ad3160cc1",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "94ade96aad13d9e20e2c7c376d0dc0ab",
".git/config": "356654b5e5aa32abd99c277c10d4ef57",
".git/objects/68/fc22a129a29e785ae92e52b0a98e1053e44532": "7a466e2da8cad2e613bb91d992f0398e",
".git/objects/9b/0d85a4e4b5f4bbaedfb3e30d233593d7a74a14": "b074ff88d483356b868bc5905cbe7a81",
".git/objects/69/27ac817f4a1f06d8f8518d1b7cf7a225236198": "fcc4a82447b5c303e272ee19328b20e9",
".git/objects/3c/e3e0a29e2be84dece9681d4c768e3d21636014": "81123bed1ab10d846b1799229c20ed0f",
".git/objects/3c/e5cc71659ad267e80b0acc8ea2d9504270a8c6": "ed3dd2a7383b4ce20d35bd3dbe822f8b",
".git/objects/58/b007afeab6938f7283db26299ce2de9475d842": "6c6cbea527763bb3cdff2cecfee91721",
".git/objects/58/356635d1dc89f2ed71c73cf27d5eaf97d956cd": "f61f92e39b9805320d2895056208c1b7",
".git/objects/0b/0d34c14719244e7ebfc95382dd74186f2350f7": "31e181840c9219ad32b8a83f7bce0d24",
".git/objects/93/f9b35a9656a3272250898111995c4ed71a57ce": "26ac1ddab475e06a1a41e10276c878e2",
".git/objects/93/7ce460ed5b63a0d1035ebc93ed76ae5b55e8e7": "375d12cb4e8a70fccaf3b6930f9bb7c9",
".git/objects/94/f7d06e926d627b554eb130e3c3522a941d670a": "77a772baf4c39f0a3a9e45f3e4b285bb",
".git/objects/0e/66cb4114494f08ae8519e0d02e6e7e481674ee": "61a84ef45d3a0dd82c44f4e2b3472ce7",
".git/objects/0e/a0692aa4c1532c98ecf728c41b6d98e3810b92": "c4b489bf2c5b9059972753e1ed5032e4",
".git/objects/60/f2c9cebd816d20f4b633f25ba9941d97cce51e": "746abf538eb650ae121dc29b5f58a19e",
".git/objects/b5/574a518fdfc746008673cd8e59838bb9277813": "874a807fba5f3a501c4783c9e1378d81",
".git/objects/b2/7831fe25640ce636d1806bd226cce798f814bf": "49ae9364ccc47b935326cc65f73cb91e",
".git/objects/d9/ea3bb56908cd5733d0c029eab676a820d97cc8": "dd6f348170eb30386d22136a84a7b938",
".git/objects/bb/e03a092fdfe5cc8738bae4bf1aa78e4f3107f4": "c083d1a2391776102e0f822e78ad9e6c",
".git/objects/b3/ebbd38f666d4ffa1a394c5de15582f9d7ca6c0": "23010709b2d5951ca2b3be3dd49f09df",
".git/objects/b4/a3ecb9428e2a4b8aff40c099e1c27d64a928f0": "6e4bc29289eb6be950713f1b329eaf0d",
".git/objects/a5/bd7eed944a130ed33e81f8124986826ebf7011": "53e7b19ad975837e0398361681240d69",
".git/objects/d1/098e7588881061719e47766c43f49be0c3e38e": "f17e6af17b09b0874aa518914cfe9d8c",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/ae/e50fbd90356a4804968de6adf9c874d2619370": "e648590faf9a52d1635382ca92fb8d2b",
".git/objects/f4/8d3b02beca0143c3e3f54b1df62ae208f1e07b": "258f157b00640a7266b14a300e68ce12",
".git/objects/f3/944a08745a88b8223f95e447ed86f1b2284f88": "1b5425df7e5e3a73bf823e69c2f2cd2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/eb/3c8df92a900c505ec3c12a18a8139d9eec4998": "55891400c293de81527dfa06c18beb42",
".git/objects/c9/bf8af1b92c723b589cc9afadff1013fa0a0213": "632f11e7fee6909d99ecfd9eeab30973",
".git/objects/fd/213d222c791955895b366fa94e7c6237575ebc": "3086dd079648187a75aa711f76860aef",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/cf/e52c36e51dfc91d94a3cf2d6f0dd1a340ebb73": "4f8d3232e1e2b6dbaefeda80bc570162",
".git/objects/cf/399518f93334a10a88d21b7859008315284266": "e7a5cdb09f5468cca61a82b76482c05c",
".git/objects/c8/0abaf3b8996f4f21358c562e98e1855ffece46": "302cd3d885cc07b3c0f4ca08faf81f42",
".git/objects/c1/3599657df3d9f3310dceebe63ef1dc94823c3c": "c007ac2a265229a7aaedb3c5602449ff",
".git/objects/20/cb2f80169bf29d673844d2bb6a73bc04f3bfb8": "b807949265987310dc442dc3f9f492a2",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/18/d55fb22550c6764871d258e6887189d30476df": "0569617567a07cd3dfc42e51fc799546",
".git/objects/18/eb401097242a0ec205d5f8abd29a4c5e09c5a3": "4e08af90d04a082aab5eee741258a1dc",
".git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904": "75589287973d2772c2fc69d664e10822",
".git/objects/7d/fd75237213e21f02dfaecbdb9db5a08e3b4039": "fd6a16a7dcb808ed1440c567f1b8ad62",
".git/objects/42/12b9a8548c93e07969d5d56098a53b98e2db46": "498924b48db8bf7dcc31f3af529bd835",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/87/f189b1b06bc4fbdf8046dceed2fa15b06de20c": "2cc16d3389fcdff30f3135d3a3f559f7",
".git/objects/74/eb08dd823054b725db17d1c139413bb6330735": "49742ca91bc3cdf4000d220ad338d503",
".git/objects/74/5e7ba6c102c55db33326a035d8c38ac99a80a8": "7d5fffbd5f225b1070dcbd3f1da8970f",
".git/objects/1a/0672df5ffcc2e39b828de24b5ed73cee9ead15": "4681d68c379c47caaf7d2c72399d50de",
".git/objects/8f/367fa4fc9bedf4d542191d3385663af97bbb55": "e1fc8b1f7d2d50aa7ad1fb1bc0f41f46",
".git/objects/8a/ddd7afba2443c46ed4e60b7b891500b1f80ca6": "0f34d8061a0304960c74b106b373af0a",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/10/16fc46fd98f35583ae5e35743a3b3f6e38117f": "13fcfbae5914830e9e68c134e0d94059",
".git/objects/10/2e6dd4acd9512478ab37406614552602ffe13c": "e077b13596e4e71c48ea4415b518782c",
".git/objects/19/6eafc70ed2a77c0abc0db9317aac1d800ac38e": "f4dae8b7b0842420d5bda1d3a54bc990",
".git/objects/26/dad669282a3347954d07e306b8e88c32ebef01": "36ab48c0ef293794eaf1c7ad768b60fc",
".git/objects/21/406f39976ba57188097c162aec4411c293c3a1": "9c50828b9fa5971111e2c6f046391488",
".git/objects/21/cb03894c588aaef83515a157faf15e6f1d69d6": "88c39327e760917422755ea0b564d8b1",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/88/505bde7b0cdc7100df54aecdaae5f8bf1fc1d0": "c7fa1076d5bb4b825d0562aa2f499475",
".git/objects/6b/6d8867bc19887d74ccb8ad48172ef13066887b": "5ed556585ad28c8c77911aa4a6c6d540",
".git/objects/09/4bb6ae24f0cd847d40cb4cc4a2434f2ec9b83b": "b9e6d850322c11db635bcf0a45b762ff",
".git/objects/65/daed15c023ac3745b28e3f356ec784cc3cbc82": "5171942beb428dc6d5fcc0efa4fb9c5a",
".git/objects/96/964653471c9c03b6497fd054fe56c387dacefc": "aa3ccbf67f97bc3150d3dbb7755e761f",
".git/objects/54/44bf95bb84dc06cadd3b56b492bf4965c45e5d": "c85dffb453ec6c1666bed24d9bef9472",
".git/objects/98/e9f092204921cd10cb14e73e93f86111b9979c": "ee4ada51464d8ba36a716e6180afcd79",
".git/objects/30/585003e7df858dbe58f49dc83694ff4141ac4d": "a0fc70735944a43dfaccfdb22c5ab7fd",
".git/objects/97/6a3ed3e145d62d1bdf5d4efbfb0a106c838041": "85797345d9b0fc6a7f528ad81e90fb83",
".git/objects/bf/bb280760d5eaa31f5479fb35f34cb7e292348a": "135033f2c69b8ca789876bd8c5a36d90",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/a7/cab17fb71943cf51344c77168fc0fe93ba4285": "e4788013ac7d74a5742c9d8ca83cb341",
".git/objects/dd/ce683824ccf569e14c3b647ec962d0772c36a3": "4bbd71a8bf53cdbc1e0422b4809c0ccc",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/1da0d366a7263d661aa89f29e2c4a1f8dacaa6": "b9a343082cdda8ce4cc3452f01a47c74",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/e8/c9c008929710158099c5005954941da39923d4": "a2a218cb8c814b2f1b83ef576d332503",
".git/objects/e9/80e6fd21a1173babf35b407e344c6f80abffb1": "a5a9909be74e83fbfa79899b74b34b47",
".git/objects/cb/f00c08bc72a5f038fa39e44903b34465b7a4c1": "991e1a07d33713e6bde2d053c1a73994",
".git/objects/79/cc7f3bf859c2b828b2ae6a836d37415f7ff8ab": "9505cd44b2c575b56fcf392ce3b6e201",
".git/objects/24/0c7cc143587149e526dc290cd39b974b0cf956": "439e1bf0841d57f503efc7fe3f529d77",
".git/objects/23/4813771b007175f392cd2af7f38fec2c663227": "8371946c5ebca705db4bc0fca11b1991",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/71/3f932c591e8f661aa4a8e54c32c196262fd574": "66c6c54fbdf71902cb7321617d5fa33c",
".git/objects/76/d8428c3b595e064dc53ebaea0643f44c2fe7b1": "b99efc96ec50ca1e59d884e035a49e66",
".git/objects/76/db1665cc756dd86d6f883f4d218790cce7b926": "d8b3ca72986fa9ec7f82d5e719a9e97c",
".git/objects/49/adebdb511c8c293b28db3f6792e5bac28cdc32": "ba6a3971e7f06834fd6ec3844372ce17",
".git/objects/40/f142625cbe370b5defcce5e20e3a77bc4d3f48": "42983802c3a8bdc65e6f94a8d9a52898",
".git/objects/8e/45addf5c16ff94eb489eaba336d48645cce827": "a9e22849cb33c9af68a87dbdc585b6b2",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "031a0801b6c24ec5243447fbc3fa7a36",
".git/logs/refs/heads/main": "79cfc71be50af2b947d6724d3d5d363a",
".git/logs/refs/remotes/origin/main": "20fc7a339c58e3b5eb5632a0aa77be9e",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "6a7765ecfa58175312522c6d6e393fd9",
".git/refs/remotes/origin/main": "6a7765ecfa58175312522c6d6e393fd9",
".git/index": "2bf3e1c265233b938e53e2e838661b49",
".git/COMMIT_EDITMSG": "611f8f68cae9e1ea8f9b8e957caae89e",
"assets/AssetManifest.json": "ff4947b3ee060bdf406e8190a358bcb6",
"assets/NOTICES": "035661059c4fee4647fbd3039bde2377",
"assets/FontManifest.json": "7fea307b8fece3cf0dd209c2591365e3",
"assets/AssetManifest.bin.json": "5d5baf1bcf31ccae518cd3db41b8ebad",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "c9c6d4b696e9329194d31f0f3cd83094",
"assets/fonts/MaterialIcons-Regular.otf": "c8c5b4232bde0c088e4cdea542bac71a",
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
