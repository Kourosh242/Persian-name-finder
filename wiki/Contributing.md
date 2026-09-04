# 🤝 مشارکت | Contributing

از مشارکت شما استقبال می‌شود! هر کمکی — از افزودن یک نام تا بهبود الگوریتم — ارزشمند است.

## راه‌های مشارکت

| نوع | چطور |
|:---|:---|
| 📚 افزودن نام | راهنمای کامل: [[Name-Database]] |
| 🐛 گزارش باگ | یک [Issue](https://github.com/Kourosh242/Persian-name-finder/issues) با توضیح و مراحل بازتولید |
| 🎨 بهبود رابط کاربری | PR با توضیح تغییرات و اسکرین‌شات |
| 🔧 الگوریتم جستجو | [[Search-Engine]] را بخوانید و ایدهٔ خود را در Issue مطرح کنید |
| 🌍 ترجمه/مستندسازی | بهبود README و صفحات `wiki/*.md` (منبع [ویکی رسمی](https://github.com/Kourosh242/Persian-name-finder/wiki)) |

## مراحل ارسال Pull Request

```bash
# ۱. فورک و کلون
git clone https://github.com/<USERNAME>/Persian-name-finder.git
cd Persian-name-finder

# ۲. شاخهٔ جدید
git checkout -b feature/my-feature

# ۳. تغییرات (مثلاً افزودن نام به آرایهٔ NAMES در index.html ریشهٔ مخزن)

# ۴. کامیت و ارسال
git add -A
git commit -m "feat: add 5 new names"
git push -u origin feature/my-feature
```

سپس از طریق گیت‌هاب Pull Request به شاخهٔ `main` بفرستید.

## قواعد مهم

1. **تک‌فایل بودن اپ را حفظ کنید** — هیچ وابستگی npm/build اضافه نکنید؛ کل اپ باید در `index.html` بماند.
2. محتوا را **محترمانه و بی‌طرف** بنویسید (معنی نام‌ها حساسیت فرهنگی دارد).
3. نام‌های جدید را فقط از منابع معتبر نام‌های ایرانی بیاموزید.
4. خروجی HTML همیشه با تابع `esc` ایمن شود (جلوگیری از XSS).
5. `CHANGELOG.md` را برای تغییرات کاربر-محور به‌روز کنید.

سازندگان: [کوروش](https://github.com/Kourosh242) · [مهدی شریفی](https://github.com/MR-SHARIFI-Dev) ❤️

← بازگشت به [[Home]]
