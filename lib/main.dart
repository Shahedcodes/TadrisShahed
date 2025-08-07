import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tadris/Splash/splash.dart';
import 'package:tadris/core/secrets/app_secrets.dart';
import 'package:tadris/core/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnnkey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tadrisi',
      theme: _buildTheme(),
      home: const AppWrapper(),
    );
  }

  ThemeData _buildTheme() {
    return Apptheme.LightThemeMode.copyWith(
      textTheme: Apptheme.LightThemeMode.textTheme.apply(
        fontFamily: 'Tajawal',
      ),
    );
  }
}

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          return const SplashBody();
        },
      ),
    );
  }
}
