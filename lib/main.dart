import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/firebase_options.dart';
import 'package:recipe_app/pages/splash.page.dart';
import 'package:recipe_app/services/prefrences.serviceds.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    PrefrencesService.prefs = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (PrefrencesService.prefs != null) {
      if (kDebugMode) {
        if (kDebugMode) {
          print(
              "================(Prefrences init successfully)================");
        }
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print(
          "================(Error  IN init  Prefrences successfully)================");
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xfff45b00),
          primary: const Color(0xfff45b00),
          secondary: const Color(0xfff45b00),
        ),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
