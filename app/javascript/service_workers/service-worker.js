function urlB64ToUint8Array(base64String) {
    const padding = '='.repeat((4 - base64String.length % 4) % 4);
    const base64 = (base64String + padding)
        .replace(/\-/g, '+')
        .replace(/_/g, '/');

    const rawData = atob(base64);
    const outputArray = new Uint8Array(rawData.length);

    for (var i = 0; i < rawData.length; ++i) {
        outputArray[i] = rawData.charCodeAt(i);
    }
    return outputArray;
}

self.addEventListener('install', function (event) {
    console.log('Service Worker installing.');
});

self.addEventListener('activate', async function (event) {
    console.log('Service Worker activated.');
    try {
        const applicationServerKey = urlB64ToUint8Array('BD0DGGv2nz04yDtPsgNpas5EaTR8BN7Cwu0Ofp5BhHTbsVVkmCNI_1P1qUSg4cEzpLoiyL_tAel_dUxV8deHi94')
        const options = { applicationServerKey, userVisibleOnly: true }
        const subscription = await self.registration.pushManager.subscribe(options)
        console.log(JSON.stringify(subscription))
    } catch (err) {
        console.log('Error', err)
    }
});
self.addEventListener('fetch', function (event) {
    console.log('Service Worker fetching.');
});
self.addEventListener('push', function (event) {
    console.log('[Service Worker] Push Received.');
    console.log(`[Service Worker] Push had this data: "${event.data.text()}"`);

    const title = 'A nice title';
    const options = {
        body: event.data.text(),
        icon: 'images/favicon-16x16.png',
        badge: 'images/favicon-32x32.png'
    };

    event.waitUntil(self.registration.showNotification(title, options));
});