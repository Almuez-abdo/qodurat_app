import 'package:flutter/material.dart';
import '../theme.dart';
import '../data.dart';

class GradHeader extends StatelessWidget {
  final String hello;
  final String name;
  const GradHeader({super.key, required this.hello, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 54, 20, 22),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.gradA, AppColors.gradB], begin: Alignment.topRight, end: Alignment.bottomLeft),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 22, backgroundColor: Colors.white24, child: Icon(Icons.person, color: Colors.white)),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(hello, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                Text(name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
              ])),
              _iconBtn(Icons.notifications_none_rounded, '3'),
              const SizedBox(width: 8),
              _iconBtn(Icons.search_rounded, ''),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: const Row(children: [
              Icon(Icons.search, color: AppColors.muted),
              SizedBox(width: 8),
              Expanded(child: Text('ابحث عن مادة، بنك أسئلة، محاضرة...', style: TextStyle(color: AppColors.muted, fontSize: 13))),
              Icon(Icons.mic_none, color: AppColors.muted),
            ]),
          ),
        ],
      ),
    );
  }
  Widget _iconBtn(IconData i, String badge) {
    return Stack(children: [
      Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: Colors.white.withOpacity(.15), borderRadius: BorderRadius.circular(14)), child: Icon(i, color: Colors.white, size: 20)),
      if (badge.isNotEmpty) Positioned(top: 4, left: 4, child: Container(padding: const EdgeInsets.all(4), decoration: const BoxDecoration(color: AppColors.accent, shape: BoxShape.circle), child: Text(badge, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))),
    ]);
  }
}

class SectionTitle extends StatelessWidget {
  final String title; final String action;
  const SectionTitle(this.title, {super.key, this.action = 'عرض الكل'});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
        Text(action, style: const TextStyle(color: AppColors.primaryLight, fontSize: 12, fontWeight: FontWeight.w700)),
      ]),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course c;
  final VoidCallback? onTap;
  const CourseCard(this.c, {super.key, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: 210,
      margin: const EdgeInsetsDirectional.only(start: 20),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(gradient: LinearGradient(colors: c.grad, begin: Alignment.topRight, end: Alignment.bottomLeft), borderRadius: BorderRadius.circular(22)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(padding: const EdgeInsets.all(9), decoration: BoxDecoration(color: Colors.white.withOpacity(.2), borderRadius: BorderRadius.circular(12)), child: Icon(c.icon, color: Colors.white)),
          Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.black.withOpacity(.25), borderRadius: BorderRadius.circular(20)), child: Text(c.college, style: const TextStyle(color: Colors.white, fontSize: 11))),
        ]),
        const Spacer(),
        Text(c.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15)),
        const SizedBox(height: 4),
        Text('${c.lessons} درس • ${c.questions} سؤال', style: const TextStyle(color: Colors.white70, fontSize: 12)),
        const SizedBox(height: 8),
        ClipRRect(borderRadius: BorderRadius.circular(10), child: LinearProgressIndicator(value: c.progress, minHeight: 6, backgroundColor: Colors.white24, valueColor: const AlwaysStoppedAnimation(AppColors.accent))),
      ]),
      ),
    );
  }
}

class QuickAction extends StatelessWidget {
  final IconData icon; final String label; final Color color;
  const QuickAction(this.icon, this.label, this.color, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: color.withOpacity(.12), borderRadius: BorderRadius.circular(18)), child: Icon(icon, color: color, size: 26)),
      const SizedBox(height: 6),
      Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
    ]);
  }
}
