import 'package:flutter/material.dart';
import '../theme.dart';
import '../data.dart';
import '../widgets/ui.dart';
import 'colleges_tab.dart';
import 'catalog_tab.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const GradHeader(hello: 'أهلاً بك في قدرات 👋', name: 'انت في المكان الصحيح'),
        const SizedBox(height: 12),
        // شريط مميزات
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
            QuickAction(Icons.quiz_outlined, 'بنك الأسئلة', Color(0xFF1D4ED8)),
            QuickAction(Icons.timer_outlined, 'محاكاة امتحان', Color(0xFFE11D48)),
            QuickAction(Icons.play_circle_outline, 'محاضرات', Color(0xFF16A34A)),
            QuickAction(Icons.groups_outlined, 'قروبات', Color(0xFFF59E0B)),
          ]),
        ),
        const SizedBox(height: 8),
        // إعلان
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: AppColors.accentSoft, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFFDE68A))),
          child: Row(children: [
            Container(padding: const EdgeInsets.all(10), decoration: const BoxDecoration(color: AppColors.accent, shape: BoxShape.circle), child: const Icon(Icons.campaign_outlined, color: Colors.white)),
            const SizedBox(width: 12),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('فتح التسجيل 15 سبتمبر 2026', style: TextStyle(fontWeight: FontWeight.w800)),
              SizedBox(height: 4),
              Text('مواد جديدة في التربية والاقتصاد + بنك أسئلة شامل بإجابات نموذجية.', style: TextStyle(fontSize: 12, color: AppColors.muted)),
            ])),
          ]),
        ),
        const SectionTitle('أكمل من حيث توقفت'),
        SizedBox(
          height: 175,
          child: ListView(scrollDirection: Axis.horizontal, children: Mock.courses.take(5).map((c) => CourseCard(c, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CourseDetail(course: c))))).toList()),
        ),
        const SectionTitle('تصفح حسب الكلية'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1.5),
            itemCount: Mock.colleges.length,
            itemBuilder: (_, i) {
              final col = Mock.colleges[i];
              final n = Mock.coursesOf(col.name).length;
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CollegeDetail(college: col))),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(gradient: LinearGradient(colors: col.grad), borderRadius: BorderRadius.circular(18)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Icon(col.icon, color: Colors.white),
                    const Spacer(),
                    Text(col.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
                    Text('$n مواد', style: const TextStyle(color: Colors.white70, fontSize: 11)),
                  ]),
                ),
              );
            },
          ),
        ),
        const SectionTitle('الإعلانات'),
        ...Mock.announcements.map((a) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.grey.shade200)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(a.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
              Text(a.date, style: const TextStyle(fontSize: 11, color: AppColors.muted)),
            ]),
            const SizedBox(height: 6),
            Text(a.body, style: const TextStyle(fontSize: 12.5, color: AppColors.muted, height: 1.6)),
          ]),
        )),
        const SizedBox(height: 90),
      ],
    );
  }
}
