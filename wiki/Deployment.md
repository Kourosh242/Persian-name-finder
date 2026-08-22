# 🚀 استقرار و اجرا | Deployment

## لینک‌های زنده (GitHub Pages)

| مسیر مخزن | URL زنده | محتوا |
|:---|:---|:---|
| `/` (index.html) | <https://kourosh242.github.io/Persian-name-finder/> | نسخهٔ ۱ (PWA) |
| `/v2/` (v2/index.html) | <https://kourosh242.github.io/Persian-name-finder/v2/> | ✨ **نسخهٔ ۲** |
| `/wiki/` (wiki/index.html) | <https://kourosh242.github.io/Persian-name-finder/wiki/> | 📖 ویکی آنلاین |
| `/Persian-name-founder-v2.html` | <https://kourosh242.github.io/Persian-name-finder/Persian-name-founder-v2.html> | سورس خام نسخهٔ ۲ |

## سازوکار استقرار

سایت روی **GitHub Pages** از شاخهٔ `main` (ریشهٔ مخزن) سرو می‌شود؛ یعنی هر merge به `main` به‌طور خودکار در چند دقیقه منتشر می‌شود — بدون نیاز به workflow یا تنظیمات اضافه.

```
push / merge به main ──▶ GitHub Pages build ──▶ ▲ به‌روزرسانی خودکار سایت
```

### افزودن نسخهٔ جدید در آینده

1. یک پوشهٔ `vN/index.html` بسازید و فایل تک‌فایلی اپ را در آن قرار دهید.
2. به `main` merge کنید؛ نسخهٔ جدید در آدرس `/vN/` زنده می‌شود.
3. لینک را در `README.md` و `CHANGELOG.md` ثبت کنید.

> 💡 نسخهٔ ۱ یک PWA کامل است (`manifest.json` + `sw.js` + آیکون‌ها) که از ریشهٔ سایت سرو می‌شود؛ نسخهٔ ۲ کاملاً تک‌فایلی است و به هیچ فایل جانبی نیاز ندارد.

## اجرای محلی

**روش ۱ — سرور ساده (پیشنهادی):**

```bash
git clone https://github.com/Kourosh242/Persian-name-finder.git
cd Persian-name-finder
python3 -m http.server 8000
```

سپس: <http://localhost:8000/> (v1) · <http://localhost:8000/v2/> (v2) · <http://localhost:8000/wiki/>

**روش ۲ — اجرای مستقیم:** فایل `Persian-name-founder-v2.html` را در مرورگر باز کنید (دابل‌کلیک).

> ⚠️ توجه: برای اتصال به ویکی‌پدیا باید اینترنت فعال باشد؛ پایگاه محلی ۱۰۰ نام کاملاً آفلاین کار می‌کند.

## سینک markdown ویکی با GitHub Wiki (اختیاری)

پوشهٔ `wiki/` شامل سورس‌های markdown (`Home.md`، `_Sidebar.md` و…) است. اگر بخواهید همین محتوا در **ویکیِ رسمی گیت‌هاب** مخزن هم نمایش داده شود، ابتدا از تب Wiki مخزن یک صفحهٔ اولیه بسازید، سپس:

```bash
git clone https://github.com/Kourosh242/Persian-name-finder.wiki.git
cp wiki/*.md Persian-name-finder.wiki/
cd Persian-name-finder.wiki && git add -A && git commit -m "sync wiki" && git push
```

← بازگشت به [[Home]]
