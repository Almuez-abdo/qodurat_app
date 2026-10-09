import 'package:flutter/material.dart';
import '../theme.dart';
import '../data.dart';

class ScheduleTab extends StatelessWidget {
  const ScheduleTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ListView(padding: const EdgeInsets.fromLTRB(20, 12, 20, 90), children: [
      const Text('جدول المحاضرات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
      const SizedBox(height: 4),
      const Text('محاضرات مجانية + مباشر + واجبات', style: TextStyle(color: AppColors.muted)),
      const SizedBox(height: 12),
      ...Mock.schedule.map((s) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.grey.shade200)),
        child: Row(children: [
          Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppColors.primary.withOpacity(.08), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.video_camera_front_outlined, color: AppColors.primary)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(s[0], style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)), Text(s[1], style: const TextStyle(fontSize: 12, color: AppColors.muted))])),
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: s[2] == 'مباشر' ? const Color(0xFFFEE2E2) : const Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(20)), child: Text(s[2], style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800))),
        ]),
      )),
      const SizedBox(height: 8),
      Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(gradient: const LinearGradient(colors: [AppColors.gradA, AppColors.gradB]), borderRadius: BorderRadius.circular(20)), child: Row(children: [
        const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('قروب تخصصك في واتساب', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
          SizedBox(height: 4),
          Text('إضافة عبر المشرف لضمان الجودة', style: TextStyle(color: Colors.white70, fontSize: 12)),
        ])),
        FilledButton(onPressed: () {}, style: FilledButton.styleFrom(backgroundColor: AppColors.accent), child: const Text('انضم', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
      ])),
      const SizedBox(height: 8),
      Center(child: Text(Mock.whatsapp, style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1))),
    ]));
  }
}

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ListView(padding: const EdgeInsets.fromLTRB(20, 12, 20, 90), children: [
      Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(gradient: const LinearGradient(colors: [AppColors.gradA, AppColors.gradB]), borderRadius: BorderRadius.circular(22)), child: const Row(children: [
        CircleAvatar(radius: 28, backgroundColor: Colors.white24, child: Icon(Icons.person, color: Colors.white, size: 30)),
        SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('طالب قدرات', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
          Text('اقتصاد • الدفعة 2025', style: TextStyle(color: Colors.white70, fontSize: 12)),
        ])),
        Icon(Icons.edit_outlined, color: Colors.white),
      ])),
      const SizedBox(height: 12),
      Row(children: [
        _mini('5', 'مواد نشطة'),
        _mini('1.2k', 'سؤال محلول'),
        _mini('87%', 'متوسط الدرجات'),
      ]),
      const SizedBox(height: 12),
      ...[
        [Icons.download_outlined, 'تحميلاتي للدراسة أوفلاين'],
        [Icons.favorite_outline, 'المفضلة'],
        [Icons.language_outlined, 'اللغة / Language  عربي'],
        [Icons.dark_mode_outlined, 'الوضع الليلي'],
        [Icons.notifications_none, 'الإشعارات'],
        [Icons.help_outline, 'المساعدة والدعم'],
        [Icons.logout, 'تسجيل الخروج'],
      ].map((e) => Container(margin: const EdgeInsets.only(bottom: 8), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)), child: ListTile(leading: Icon(e[0] as IconData, color: AppColors.primary), title: Text(e[1] as String, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700)), trailing: const Icon(Icons.chevron_left, size: 18)))),
    ]));
  }
  Widget _mini(String v, String l) => Expanded(child: Container(margin: const EdgeInsetsDirectional.only(end: 8), padding: const EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)), child: Column(children: [Text(v, style: const TextStyle(fontWeight: FontWeight.w900)), Text(l, style: const TextStyle(fontSize: 11, color: AppColors.muted))])));

}
