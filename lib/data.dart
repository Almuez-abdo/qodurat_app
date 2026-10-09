import 'package:flutter/material.dart';

class Course {
  final int id;
  final String title;
  final String college; // اقتصاد | حاسوب | قانون | تربية | لغات
  final String level;
  final int lessons;
  final int questions;
  final double progress; // 0..1
  final IconData icon;
  final List<Color> grad;
  const Course({required this.id, required this.title, required this.college, required this.level, required this.lessons, required this.questions, this.progress = 0, required this.icon, required this.grad});
}

class Announcement {
  final String title;
  final String body;
  final String date;
  const Announcement(this.title, this.body, this.date);
}

class QuizQ {
  final String q;
  final List<String> options;
  final int answer;
  final String explain;
  const QuizQ(this.q, this.options, this.answer, this.explain);
}

class College {
  final String id; // econ | cs | law | edu | lang
  final String name;
  final String desc;
  final IconData icon;
  final List<Color> grad;
  const College({required this.id, required this.name, required this.desc, required this.icon, required this.grad});
}

class Mock {
  static const whatsapp = '00249912245749';

  static const colleges = [
    College(id: 'econ', name: 'الاقتصاد', desc: 'إدارة • محاسبة • اقتصاد • تسويق • بنوك', icon: Icons.business_center_outlined, grad: [Color(0xFF0F3A5D), Color(0xFF1E88C5)]),
    College(id: 'cs', name: 'الحاسوب', desc: 'برمجة • شبكات • قواعد بيانات • ذكاء اصطناعي', icon: Icons.computer_outlined, grad: [Color(0xFF111827), Color(0xFF4F46E5)]),
    College(id: 'law', name: 'القانون', desc: 'دستوري • جنائي • إداري • أحوال شخصية', icon: Icons.gavel_outlined, grad: [Color(0xFF3F3F46), Color(0xFF71717A)]),
    College(id: 'edu', name: 'التربية', desc: 'مناهج • مقاصد الشريعة • مهارات التعلم', icon: Icons.school_outlined, grad: [Color(0xFF713F12), Color(0xFFEAB308)]),
    College(id: 'lang', name: 'اللغات', desc: 'إنجليزية 1-6 • مهارات لغوية', icon: Icons.translate_outlined, grad: [Color(0xFF1D4ED8), Color(0xFF60A5FA)]),
  ];

  static List<Course> coursesOf(String collegeName) => courses.where((c) => c.college == collegeName).toList();

  static String collegeNameById(String id) => colleges.firstWhere((c) => c.id == id).name;

  static const announcements = [
    Announcement('فتح باب التسجيل للفصل القادم', 'يسر إدارة قدرات أن تعلن عن فتح التسجيل اعتباراً من 15 سبتمبر 2026 لجميع الأعضاء القدامى والجدد، مع مواد جديدة في التربية والاقتصاد وبنك أسئلة شامل.', '2026/09/15'),
    Announcement('انضم لقروب تخصصك', 'قروبات مخصصة لكل تخصص بإشراف مباشر. أرسل الاسم + التخصص + الدفعة + الفرع على واتساب للانضمام.', '2026/09/20'),
    Announcement('جدول المحاضرات المجانية', 'سيتم إدراج جدول المحاضرات المجانية قريباً في المجموعات الخاصة بالموقع.', 'قريباً'),
  ];

  static const courses = [
    Course(id: 113, title: 'مبادئ الاقتصاد', college: 'الاقتصاد', level: 'المستوى الأول', lessons: 24, questions: 340, progress: .65, icon: Icons.show_chart, grad: [Color(0xFF0F3A5D), Color(0xFF1E88C5)]),
    Course(id: 114, title: 'مبادئ المحاسبة المالية', college: 'الاقتصاد', level: 'المستوى الأول', lessons: 28, questions: 420, progress: .40, icon: Icons.account_balance_wallet_outlined, grad: [Color(0xFF134E4A), Color(0xFF14B8A6)]),
    Course(id: 18, title: 'الإحصاء الإداري', college: 'الاقتصاد', level: 'المستوى الثاني', lessons: 20, questions: 280, progress: .15, icon: Icons.bar_chart_outlined, grad: [Color(0xFF7C3AED), Color(0xFF06B6D4)]),
    Course(id: 198, title: 'أساليب البرمجة 1', college: 'الحاسوب', level: 'المستوى الأول', lessons: 32, questions: 310, progress: .80, icon: Icons.code, grad: [Color(0xFF111827), Color(0xFF4F46E5)]),
    Course(id: 213, title: 'هياكل البيانات', college: 'الحاسوب', level: 'المستوى الثاني', lessons: 26, questions: 260, progress: .25, icon: Icons.account_tree_outlined, grad: [Color(0xFF9A3412), Color(0xFFF59E0B)]),
    Course(id: 118, title: 'الذكاء الاصطناعي', college: 'الحاسوب', level: 'المستوى الرابع', lessons: 22, questions: 190, progress: 0, icon: Icons.smart_toy_outlined, grad: [Color(0xFF831843), Color(0xFFEC4899)]),
    Course(id: 116, title: 'القانون الدستوري', college: 'القانون', level: 'المستوى الأول', lessons: 18, questions: 220, progress: .5, icon: Icons.gavel_outlined, grad: [Color(0xFF3F3F46), Color(0xFF71717A)]),
    Course(id: 155, title: 'القانون الجنائي (القسم العام)', college: 'القانون', level: 'المستوى الثاني', lessons: 21, questions: 300, progress: 0, icon: Icons.balance_outlined, grad: [Color(0xFF064E3B), Color(0xFF059669)]),
    Course(id: 123, title: 'اللغة الإنجليزية 1', college: 'اللغات', level: 'المستوى الأول', lessons: 16, questions: 180, progress: .9, icon: Icons.translate, grad: [Color(0xFF1D4ED8), Color(0xFF60A5FA)]),
    Course(id: 199, title: 'مقاصد الشريعة', college: 'التربية', level: 'عام', lessons: 14, questions: 150, progress: .3, icon: Icons.mosque_outlined, grad: [Color(0xFF713F12), Color(0xFFEAB308)]),
  ];

  static const quiz = [
    QuizQ('أي مما يلي يعتبر من الأصول المتداولة؟', ['المباني', 'المخزون', 'الشهرة', 'الأراضي'], 1, 'المخزون أصل متداول لأنه يتحول لنقد خلال دورة التشغيل.'),
    QuizQ('المعادلة المحاسبية الأساسية هي:', ['الأصول = الخصوم + حقوق الملكية', 'الأصول = الخصوم - حقوق الملكية', 'الخصوم = الأصول + حقوق الملكية', 'لا شيء مما سبق'], 0, 'الأصول = الخصوم + حقوق الملكية دائماً.'),
    QuizQ('في هياكل البيانات: أفضل بنية للـ LIFO هي:', ['Queue', 'Stack', 'Array فقط', 'Graph'], 1, 'الـ Stack تعمل بنظام Last In First Out.'),
    QuizQ('مفهوم النقود والبنوك يرتبط أساساً بـ:', ['السياسة النقدية', 'التسويق', 'إدارة المخازن', 'الترجمة'], 0, 'النقود والبنوك جزء من الاقتصاد النقدي والمصرفي.'),
  ];

  static const schedule = [
    ['مبادئ الاقتصاد - مراجعة الفصل 3', 'السبت 7م', 'مباشر'],
    ['أساليب البرمجة 1 - لاب عملي', 'الأحد 6م', 'حضوري'],
    ['القانون الدستوري - أسئلة سابقة', 'الاثنين 8م', 'مباشر'],
    ['الإحصاء الإداري - واجب 2', 'الثلاثاء 11م', 'تسليم'],
  ];
}
