# تطبيق قدرات - Qodurat App

تصميم Flutter عصري بديل لمنصة dr-maan.sd (Moodle Klass).

## المميزات المنقولة من المنصة الأصلية
- الرئيسية: ترحيب + بحث + إعلانات Feedback + مواد مقترحة + كليات + تعليقات
- المواد: كل الكليات (اقتصاد / حاسوب / قانون / تربية / لغات) مع فلترة + تقدم + تفاصيل مادة
- تفاصيل مادة: دروس + بنك أسئلة + إجابات نموذجية + واجبات + التحاق + واتساب 00249912245749
- بنك الأسئلة: عرض سؤال + خيارات + إجابة نموذجية + شرح 💡
- محاكاة امتحان: مؤقت + تقدم + تصحيح فوري + نتيجة نهائية
- جدول المحاضرات: مباشر / حضوري / تسليم + قروبات واتساب تخصص
- حسابي: ملف + إحصائيات + تحميلات أوفلاين + مفضلة + لغة عربي/English + ليلي + إشعارات
- دخول: Splash + Login + ضيف + RTL كامل بخط Cairo

## التشغيل
```bash
cd qodurat_app
flutter pub get
flutter run
```

> Flutter غير مثبت على هذا الجهاز حالياً، لكن المشروع كامل وجاهز للتشغيل بمجرد تثبيته من flutter.dev

## الهيكل (مقسّم حسب الكليات)
```
lib/main.dart -> Splash + Login + BottomNav [رئيسية / الكليات / الجدول / حسابي]
lib/theme.dart -> ألوان كحلي #0F3A5D + ذهبي #F2A900 + خط Cairo
lib/data.dart -> College + Course + Mock (coursesOf لكل كلية)
lib/screens/home_tab.dart -> ترحيب + كليات Grid + مواد مقترحة
lib/screens/colleges_tab.dart -> CollegesTab (شبكة 5 كليات) + CollegeDetail (إحصائيات + مستويات + مواد الكلية فقط)
lib/screens/catalog_tab.dart -> CourseDetail + Bank + Exam (مشترك لكل الكليات)
lib/screens/extra_tabs.dart -> Schedule + Account
```
كل كلية الآن صفحة مستقلة: الاقتصاد / الحاسوب / القانون / التربية / اللغات، بدل عرض كل المواد في مكان واحد.

## لماذا أجمل من الموقع؟
- بدل theme_klass القديم + no-image لكل الكورسات: بطاقات Gradient لكل كلية + أيقونات
- بدل Feedback للإعلانات: كروت إعلانات + شارة + BottomSheet
- BottomNav عائم + زر امتحان سريع + تجربة موبايل حقيقية RTL

## ملاحظة
المشروع يحتوي مجلد `lib/` فقط حالياً (بدون `android/` و `ios/`). لتوليد مجلدات المنصات نفّذ داخل المشروع:
```bash
flutter create --platforms=android,ios .
```
ثم:
```bash
flutter pub get
flutter run
```
