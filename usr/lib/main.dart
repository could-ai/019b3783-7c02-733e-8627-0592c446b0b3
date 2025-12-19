import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'موقع تجريبي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Arial', // Using a standard font that supports Arabic usually
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WebsiteHomePage(),
      },
    );
  }
}

class WebsiteHomePage extends StatelessWidget {
  const WebsiteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Force RTL direction for Arabic content
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('موقعي الرائع', style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            // Hide menu items on small screens if needed, but for now keep simple
            TextButton(onPressed: () {}, child: const Text('الرئيسية')),
            TextButton(onPressed: () {}, child: const Text('من نحن')),
            TextButton(onPressed: () {}, child: const Text('خدماتنا')),
            TextButton(onPressed: () {}, child: const Text('اتصل بنا')),
            const SizedBox(width: 20),
          ],
          backgroundColor: Colors.white,
          elevation: 2,
          shadowColor: Colors.black12,
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(),
              SizedBox(height: 40),
              ServicesSection(),
              SizedBox(height: 40),
              AboutSection(),
              SizedBox(height: 40),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        children: [
          Text(
            'مرحباً بكم في موقعنا الجديد',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'نحن نقدم أفضل الحلول التقنية لبناء مستقبلك الرقمي.\nابدأ رحلتك معنا اليوم.',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: const Text('ابدأ الآن', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'خدماتنا المميزة',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: const [
              ServiceCard(
                icon: Icons.web,
                title: 'تطوير المواقع',
                description: 'تصميم وتطوير مواقع ويب حديثة ومتجاوبة مع جميع الأجهزة.',
              ),
              ServiceCard(
                icon: Icons.mobile_friendly,
                title: 'تطبيقات الجوال',
                description: 'بناء تطبيقات قوية لأنظمة Android و iOS باستخدام Flutter.',
              ),
              ServiceCard(
                icon: Icons.analytics,
                title: 'تحليل البيانات',
                description: 'حلول ذكية لتحليل البيانات ومساعدتك في اتخاذ القرارات.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 50, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 15),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey[100],
      child: Column(
        children: [
          Text(
            'من نحن',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'نحن فريق من المطورين والمصممين الشغوفين بالتكنولوجيا. نسعى لتقديم أفضل تجربة للمستخدم من خلال تصميمات عصرية وأداء عالي. هدفنا هو مساعدة الشركات والأفراد على تحقيق أهدافهم الرقمية.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: Colors.grey[900],
      child: const Text(
        '© 2024 جميع الحقوق محفوظة - موقعي الرائع',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
