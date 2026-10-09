import 'package:flutter/material.dart';
import '../theme.dart';
import '../data.dart';

class CatalogTab extends StatefulWidget {
  const CatalogTab({super.key});
  @override
  State<CatalogTab> createState() => _CatalogTabState();
}

class _CatalogTabState extends State<CatalogTab> {
  String filter = 'الكل';
  @override
  Widget build(BuildContext context) {
    final cats = ['الكل', 'الاقتصاد', 'الحاسوب', 'القانون', 'التربية', 'اللغات'];
    final list = filter == 'الكل' ? Mock.courses : Mock.courses.where((c) => c.college == filter).toList();
    return SafeArea(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
          child: Row(children: [
            const Expanded(child: Text('المواد الدراسية', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900))),
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade200)), child: Text('${Mock.courses.length} مادة', style: const TextStyle(fontSize: 12))),
          ]),
        ),
        SizedBox(height: 42, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16), children: [
          for (final k in cats)
            Padding(padding: const EdgeInsetsDirectional.only(end: 8), child: ChoiceChip(label: Text(k), selected: filter == k, onSelected: (_) => setState(() => filter = k), selectedColor: AppColors.primary, labelStyle: TextStyle(color: filter == k ? Colors.white : AppColors.ink))),
        ])),
        Expanded(
          child: ListView.builder(padding: const EdgeInsets.fromLTRB(20, 8, 20, 90), itemCount: list.length, itemBuilder: (_, i) {
            final c = list[i];
            return _row(context, c);
          }),
        ),
      ]),
    );
  }

  Widget _row(BuildContext context, Course c) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CourseDetail(course: c))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade200)),
        child: Row(children: [
          Container(width: 56, height: 56, decoration: BoxDecoration(gradient: LinearGradient(colors: c.grad), borderRadius: BorderRadius.circular(16)), child: Icon(c.icon, color: Colors.white)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(c.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
            const SizedBox(height: 4),
            Text('${c.college} • ${c.level}', style: const TextStyle(fontSize: 12, color: AppColors.muted)),
            const SizedBox(height: 6),
            ClipRRect(borderRadius: BorderRadius.circular(8), child: LinearProgressIndicator(value: c.progress, minHeight: 5, backgroundColor: Colors.grey.shade200, valueColor: const AlwaysStoppedAnimation(AppColors.success))),
          ])),
          const Icon(Icons.chevron_left, color: AppColors.muted),
        ]),
      ),
    );
  }
}

class CourseDetail extends StatelessWidget {
  final Course course;
  const CourseDetail({super.key, required this.course});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(expandedHeight: 210, pinned: true, flexibleSpace: FlexibleSpaceBar(
          title: Text(course.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
          background: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: course.grad)), child: Center(child: Icon(course.icon, size: 72, color: Colors.white.withOpacity(.9)))),
        )),
        SliverToBoxAdapter(
          child: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              _stat('${course.lessons}', 'درس'),
              _stat('${course.questions}', 'سؤال'),
              _stat('${(course.progress * 100).toInt()}%', 'إنجاز'),
            ]),
            const SizedBox(height: 14),
            const Text('عن المادة', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            const SizedBox(height: 6),
            const Text('شرح مبسط + بنك أسئلة شامل بإجابات نموذجية + محاكاة امتحان واقعية تحاكي قاعة الاختبار، مع واجبات ومتابعة تقدم.', style: TextStyle(color: AppColors.muted, height: 1.7)),
            const SizedBox(height: 14),
            GridView.count(crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 1.6, children: [
              _tile(Icons.quiz_outlined, 'بنك الأسئلة', 'تصفح', () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BankScreen()))),
              _tile(Icons.timer_outlined, 'محاكاة امتحان', 'ابدأ الآن', () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ExamScreen()))),
              _tile(Icons.play_circle_outline, 'المحاضرات', '${course.lessons} محاضرة', () {}),
              _tile(Icons.assignment_outlined, 'الواجبات', 'واجبان جديدان', () {}),
            ]),
            const SizedBox(height: 16),
            SizedBox(width: double.infinity, child: FilledButton(onPressed: () {}, style: FilledButton.styleFrom(backgroundColor: AppColors.primary, padding: const EdgeInsets.symmetric(vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))), child: const Text('التحق بالمادة الآن'))),
            const SizedBox(height: 8),
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: Text('تواصل واتساب ${Mock.whatsapp}', style: const TextStyle(fontSize: 12)))),
          ])),
        ),
      ]),
    );
  }
  Widget _stat(String v, String l) => Expanded(child: Container(margin: const EdgeInsetsDirectional.only(end: 8), padding: const EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)), child: Column(children: [Text(v, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)), Text(l, style: const TextStyle(fontSize: 12, color: AppColors.muted))])));

  Widget _tile(IconData i, String t, String s, VoidCallback onTap) => GestureDetector(onTap: onTap, child: Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.grey.shade200)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(i, color: AppColors.primary), const Spacer(), Text(t, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)), Text(s, style: const TextStyle(fontSize: 11, color: AppColors.primaryLight))])));
}

class BankScreen extends StatelessWidget {
  const BankScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('بنك الأسئلة')), body: ListView.builder(padding: const EdgeInsets.all(20), itemCount: Mock.quiz.length, itemBuilder: (_, i) {
      final q = Mock.quiz[i];
      return Container(margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.grey.shade200)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('س${i + 1}: ${q.q}', style: const TextStyle(fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        for (int k = 0; k < q.options.length; k++)
          Container(margin: const EdgeInsets.only(bottom: 6), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), decoration: BoxDecoration(color: k == q.answer ? const Color(0xFFDCFCE7) : AppColors.bg, borderRadius: BorderRadius.circular(12), border: Border.all(color: k == q.answer ? AppColors.success : Colors.grey.shade200)), child: Row(children: [Expanded(child: Text(q.options[k], style: const TextStyle(fontSize: 13))), if (k == q.answer) const Icon(Icons.check_circle, color: AppColors.success, size: 18)])),
        Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppColors.accentSoft, borderRadius: BorderRadius.circular(12)), child: Text('💡 ${q.explain}', style: const TextStyle(fontSize: 12))),
      ]));
    }));
  }
}

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});
  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  int idx = 0; int? picked; int score = 0;
  @override
  Widget build(BuildContext context) {
    final q = Mock.quiz[idx];
    return Scaffold(
      appBar: AppBar(title: Text('محاكاة امتحان ${idx + 1}/${Mock.quiz.length}')),
      body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
        ClipRRect(borderRadius: BorderRadius.circular(10), child: LinearProgressIndicator(value: (idx + 1) / Mock.quiz.length, minHeight: 8)),
        const SizedBox(height: 16),
        Container(width: double.infinity, padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade200)), child: Column(children: [
          const Row(children: [Icon(Icons.timer_outlined, size: 18, color: AppColors.danger), SizedBox(width: 6), Text('24:59 متبقي', style: TextStyle(color: AppColors.danger, fontWeight: FontWeight.bold))]),
          const SizedBox(height: 12),
          Text(q.q, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800), textAlign: TextAlign.center),
        ])),
        const SizedBox(height: 14),
        ...List.generate(q.options.length, (k) => GestureDetector(
          onTap: () => setState(() => picked = k),
          child: Container(width: double.infinity, margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14), decoration: BoxDecoration(color: picked == k ? AppColors.primary : Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: picked == k ? AppColors.primary : Colors.grey.shade300)), child: Text(q.options[k], style: TextStyle(color: picked == k ? Colors.white : AppColors.ink, fontWeight: FontWeight.w700))),
        )),
        const Spacer(),
        SizedBox(width: double.infinity, child: FilledButton(
          onPressed: picked == null ? null : () {
            if (picked == q.answer) score++;
            if (idx < Mock.quiz.length - 1) { setState(() { idx++; picked = null; }); } else {
              showDialog(context: context, builder: (_) => AlertDialog(title: const Text('🎉 نتيجتك'), content: Text('أجبت صح على $score من ${Mock.quiz.length}\nتجربة واقعية كأنك في قاعة الاختبار!'), actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text('تم'))]));
            }
          },
          style: FilledButton.styleFrom(backgroundColor: AppColors.primary, padding: const EdgeInsets.symmetric(vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
          child: Text(idx == Mock.quiz.length - 1 ? 'إنهاء الامتحان' : 'السؤال التالي'),
        )),
      ])),
    );
  }
}
