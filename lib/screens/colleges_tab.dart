import 'package:flutter/material.dart';
import '../theme.dart';
import '../data.dart';
import 'catalog_tab.dart';

class CollegesTab extends StatelessWidget {
  const CollegesTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(padding: const EdgeInsets.fromLTRB(20, 12, 20, 90), children: [
        const Text('الكليات', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
        const Text('اختر كليتك — كل كلية لها موادها وبنك أسئلتها وجدولها', style: TextStyle(color: AppColors.muted, fontSize: 12.5)),
        const SizedBox(height: 14),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: .88),
          itemCount: Mock.colleges.length,
          itemBuilder: (_, i) {
            final col = Mock.colleges[i];
            final count = Mock.coursesOf(col.name).length;
            final qs = Mock.coursesOf(col.name).fold<int>(0, (s, c) => s + c.questions);
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CollegeDetail(college: col))),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(gradient: LinearGradient(colors: col.grad, begin: Alignment.topRight, end: Alignment.bottomLeft), borderRadius: BorderRadius.circular(22)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: Colors.white.withOpacity(.2), borderRadius: BorderRadius.circular(14)), child: Icon(col.icon, color: Colors.white, size: 26)),
                  const Spacer(),
                  Text(col.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 17)),
                  Text(col.desc, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.5)),
                  const SizedBox(height: 8),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: Colors.black.withOpacity(.25), borderRadius: BorderRadius.circular(20)), child: Text('$count مواد • $qs سؤال', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700))),
                ]),
              ),
            );
          },
        ),
      ]),
    );
  }
}

class CollegeDetail extends StatelessWidget {
  final College college;
  const CollegeDetail({super.key, required this.college});
  @override
  Widget build(BuildContext context) {
    final list = Mock.coursesOf(college.name);
    // تجميع حسب المستوى
    final Map<String, List<Course>> byLevel = {};
    for (final c in list) {
      byLevel.putIfAbsent(c.level, () => []).add(c);
    }
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 190,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('كلية ${college.name}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
            background: Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: college.grad)),
              child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(college.icon, size: 54, color: Colors.white.withOpacity(.95)),
                const SizedBox(height: 6),
                Text(college.desc, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ])),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              _stat('${list.length}', 'مادة'),
              _stat('${list.fold(0, (s, c) => s + c.lessons)}', 'درس'),
              _stat('${list.fold(0, (s, c) => s + c.questions)}', 'سؤال'),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: FilledButton.icon(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ExamScreen())), icon: const Icon(Icons.bolt, size: 18), label: const Text('محاكاة امتحان الكلية'), style: FilledButton.styleFrom(backgroundColor: AppColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))))),
              const SizedBox(width: 8),
              Expanded(child: OutlinedButton.icon(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BankScreen())), icon: const Icon(Icons.quiz_outlined, size: 18), label: const Text('بنك الأسئلة'))),
            ]),
            const SizedBox(height: 14),
            if (list.isEmpty) const Center(child: Text('ستضاف مواد قريباً لهذه الكلية', style: TextStyle(color: AppColors.muted))),
            for (final level in byLevel.keys) ...[
              Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Text(level, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15))),
              ...byLevel[level]!.map((c) => _courseRow(context, c)),
            ],
            const SizedBox(height: 20),
          ])),
        ),
      ]),
    );
  }

  Widget _stat(String v, String l) => Expanded(child: Container(margin: const EdgeInsetsDirectional.only(end: 8), padding: const EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)), child: Column(children: [Text(v, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)), Text(l, style: const TextStyle(fontSize: 12, color: AppColors.muted))])));

  Widget _courseRow(BuildContext context, Course c) => GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CourseDetail(course: c))),
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.grey.shade200)),
      child: Row(children: [
        Container(width: 50, height: 50, decoration: BoxDecoration(gradient: LinearGradient(colors: c.grad), borderRadius: BorderRadius.circular(14)), child: Icon(c.icon, color: Colors.white)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(c.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13.5)),
          Text('${c.lessons} درس • ${c.questions} سؤال', style: const TextStyle(fontSize: 11.5, color: AppColors.muted)),
        ])),
        const Icon(Icons.chevron_left, color: AppColors.muted),
      ]),
    ),
  );
}
