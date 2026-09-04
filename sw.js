/* ──────────────────────────────────────────────────────────────
   سرویس‌ورکر بازنشسته (kill-switch)

   نسخهٔ ۱ (PWA) بازنشسته شد و اپ اکنون مستقیماً از آدرس اصلی سرو
   می‌شود. این فایل فقط برای کاربرانی نگه داشته شده که سرویس‌ورکر
   قدیمی روی مرورگرشان ثبت شده است: کش‌های قدیمی را پاک می‌کند،
   خودش را از ثبت خارج می‌کند و صفحه‌های باز را تازه‌سازی می‌کند.
   هیچ درخواستی را دیگر از کش پاسخ نمی‌دهد.
   ────────────────────────────────────────────────────────────── */

self.addEventListener('install', function (e) {
  self.skipWaiting();
});

self.addEventListener('activate', function (e) {
  e.waitUntil((async function () {
    try {
      const keys = await caches.keys();
      await Promise.all(keys.map(function (k) { return caches.delete(k); }));
    } catch (err) {}

    try { await self.registration.unregister(); } catch (err) {}

    try {
      const clients = await self.clients.matchAll({ type: 'window' });
      clients.forEach(function (c) { c.navigate(c.url); });
    } catch (err) {}
  })());
});
