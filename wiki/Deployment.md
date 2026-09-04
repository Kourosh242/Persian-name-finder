# 🚀 استقرار و اجرا | Deployment

## لینک‌های زنده (GitHub Pages)

| مسیر مخزن | URL زنده | محتوا |
|:---|:---|:---|
| `/` (`index.html`) | <https://kourosh242.github.io/Persian-name-finder/> | ✨ **اپ — همیشه آخرین نسخه** |
| `/v2/` (`v2/index.html`) | <https://kourosh242.github.io/Persian-name-finder/v2/> | ↪️ ریدایرکت به ریشه (سازگاری لینک‌های قدیمی) |
| `/wiki/` (`wiki/index.html`) | <https://kourosh242.github.io/Persian-name-finder/wiki/> | 📖 آینهٔ ویکی |
| — | <https://github.com/Kourosh242/Persian-name-finder/wiki> | 📖 **ویکی رسمی گیت‌هاب** |

## سازوکار استقرار

سایت روی **GitHub Pages** از شاخهٔ `main` (ریشهٔ مخزن) سرو می‌شود؛ یعنی هر merge به `main` به‌طور خودکار در چند دقیقه منتشر می‌شود — بدون نیاز به workflow یا تنظیمات اضافه.

```
push / merge به main ──▶ GitHub Pages build ──▶ ▲ به‌روزرسانی خودکار سایت
```

### 🧭 قانون طلایی: یک آدرس ثابت

اپ **فقط** روی ریشه (`/`) منتشر می‌شود. پوشهٔ نسخه‌دار (`/v2/`, `/v3/`, …) نمی‌سازیم.

**انتشار نسخهٔ بعدی (مثلاً ۳):**

1. فایل تک‌فایلی نسخهٔ جدید را **جایگزین `index.html` ریشه** کنید.
2. شمارهٔ نسخه را در `CHANGELOG.md` و صفحهٔ [[Versions]] ثبت کنید.
3. merge به `main` — همان آدرس همیشگی حالا نسخهٔ ۳ را نشان می‌دهد. تمام.

> ⚠️ هیچ لینک جدیدی منتشر نکنید؛ کاربران فقط یک آدرس را می‌شناسند:
> <https://kourosh242.github.io/Persian-name-finder/>

### 🗄 بازنشستگی نسخهٔ ۱ و PWA

- `manifest.json` حذف شد (PWA کنار گذاشته شد).
- `sw.js` به یک **سرویس‌ورکر kill-switch** تبدیل شد: در `activate` همهٔ کش‌ها را پاک می‌کند، `registration.unregister()` می‌زند و تب‌های باز را reload می‌کند.
- در `index.html` هم یک اسکریپت کوچک، سرویس‌ورکرهای باقی‌مانده و کش‌های قدیمی مرورگر را پاک می‌کند.
- در نتیجه کاربرانی که نسخهٔ ۱ را روی گوشی «نصب» کرده بودند، به‌جای نسخهٔ کش‌شدهٔ قدیمی، اپ به‌روز را می‌بینند.

## اجرای محلی

**روش ۱ — سرور ساده (پیشنهادی):**

```bash
git clone https://github.com/Kourosh242/Persian-name-finder.git
cd Persian-name-finder
python3 -m http.server 8000
```

سپس: <http://localhost:8000/> (اپ) · <http://localhost:8000/wiki/> (ویکی)

**روش ۲ — اجرای مستقیم:** فایل `index.html` را در مرورگر باز کنید (دابل‌کلیک).

> ⚠️ توجه: برای اتصال به ویکی‌پدیا باید اینترنت فعال باشد؛ پایگاه محلی ۱۰۰ نام کاملاً آفلاین کار می‌کند.

## 📖 همگام‌سازی ویکی با GitHub Wiki

سورس markdown همهٔ صفحات ویکی در پوشهٔ `wiki/` مخزن نگهداری می‌شود و **ویکی رسمی گیت‌هاب** از همین فایل‌ها تغذیه می‌شود.

```bash
# پیش‌نیاز: یک صفحه در تب Wiki مخزن ساخته شده باشد (فقط بار اول، از رابط گیت‌هاب)
./scripts/publish-wiki.sh
```

اسکریپت `scripts/publish-wiki.sh` مخزن `Persian-name-finder.wiki.git` را کلون می‌کند، فایل‌های `wiki/*.md` را کپی و push می‌کند. بعد از آن، صفحات در
<https://github.com/Kourosh242/Persian-name-finder/wiki> در دسترس‌اند.

> 💡 نسخهٔ HTML ویکی (`wiki/index.html`) به‌عنوان **آینه** روی GitHub Pages باقی می‌ماند؛ ویکی مرجع، GitHub Wiki است.

← بازگشت به [[Home]]
