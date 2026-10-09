import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'theme.dart';
import 'data.dart';
import 'screens/home_tab.dart';
import 'screens/colleges_tab.dart';
import 'screens/catalog_tab.dart';
import 'screens/extra_tabs.dart';

void main() => runApp(const QoduratApp());

class QoduratApp extends StatelessWidget {
  const QoduratApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'قدرات | Qodurat',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.light(),
      home: const SplashScreen(),
      builder: (c, child) => Directionality(textDirection: TextDirection.rtl, child: child!),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.gradA, AppColors.gradB], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(radius: 44, backgroundColor: Colors.white, child: Text('ق', style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900, color: AppColors.primary))),
          SizedBox(height: 14),
          Text('قدرات للتعليم الإلكتروني', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
          SizedBox(height: 6),
          Text('ليس للنجاح حدود • نحن الأفضل', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 24),
          CircularProgressIndicator(color: AppColors.accent),
        ]),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: const EdgeInsets.fromLTRB(24, 70, 24, 24), children: [
        const Center(child: CircleAvatar(radius: 36, backgroundColor: AppColors.primary, child: Text('ق', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900)))),
        const SizedBox(height: 12),
        const Center(child: Text('مرحباً بك في قدرات', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900))),
        const Center(child: Text('dr-maan.sd على جوالك', style: TextStyle(color: AppColors.muted))),
        const SizedBox(height: 24),
        const TextField(decoration: InputDecoration(labelText: 'رقم الهاتف أو البريد', prefixIcon: Icon(Icons.person_outline))),
        const SizedBox(height: 12),
        const TextField(obscureText: true, decoration: InputDecoration(labelText: 'كلمة المرور', prefixIcon: Icon(Icons.lock_outline), suffixIcon: Icon(Icons.visibility_off_outlined))),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity, child: FilledButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AppShell())), style: FilledButton.styleFrom(backgroundColor: AppColors.primary, padding: const EdgeInsets.symmetric(vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))), child: const Text('تسجيل الدخول'))),
        const SizedBox(height: 10),
        OutlinedButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AppShell())), child: const Text('دخول كضيف - استكشف المواد')),
        const SizedBox(height: 12),
        Center(child: Text('تواصل واتساب: ${Mock.whatsapp}', style: const TextStyle(fontSize: 12, color: AppColors.muted))),
      ]),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _ShellState();
}

class _ShellState extends State<AppShell> {
  int idx = 0;
  final pages = const [HomeTab(), CollegesTab(), ScheduleTab(), AccountTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: idx, children: pages),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 20)]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BottomNavigationBar(
            currentIndex: idx,
            onTap: (i) => setState(() => idx = i),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.muted,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'الرئيسية'),
              BottomNavigationBarItem(icon: Icon(Icons.account_balance_outlined), activeIcon: Icon(Icons.account_balance), label: 'الكليات'),
              BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), activeIcon: Icon(Icons.calendar_month), label: 'الجدول'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'حسابي'),
            ],
          ),
        ),
      ),
      floatingActionButton: idx == 1 ? FloatingActionButton.extended(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ExamScreen())), backgroundColor: AppColors.accent, foregroundColor: Colors.black, icon: const Icon(Icons.bolt), label: const Text('امتحان سريع', style: TextStyle(fontWeight: FontWeight.w800))) : null,
    );
  }
}
