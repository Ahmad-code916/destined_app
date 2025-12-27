import 'package:destined_app/screens/splash_screen/splash_screen.dart';
import 'package:destined_app/services/local_controller.dart';
import 'package:destined_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSzIsInJlZiI6InZhcG11Z2Npa3p4bGV4dnVwY3ZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTUzMjc4NTQsImV4cCI6MjA3MDkwMzg1NH0.DYC7K8cEOWKb9pRyX12o4TneJo8FpIdBAukY0P_0PgA',
    url: 'https://vapmugcikzxlexvupcvd.supabase.co',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localController = Get.put(LocalController());
    return GetBuilder<LocalController>(
      builder: (context) {
        return GetMaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          translations: AppStrings(),
          fallbackLocale: localController.currentLocale,
          locale: localController.currentLocale,
          supportedLocales: [Locale('en', 'US'), Locale('ur', 'PK')],
          home: SplashScreen(),
        );
      },
    );
  }
}
