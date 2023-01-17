import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/SingleExpenditureController.dart';
import 'package:organizer_app/firebase_options.dart';
import 'package:organizer_app/screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

  final SingleExpenditureController seController = Get.put(SingleExpenditureController());

  @override
  Widget build(BuildContext context) {
    initialiseFirebase();
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('zh'),
        Locale('fr'),
        Locale('es'),
        Locale('de'),
        Locale('ru'),
        Locale('ja'),
        Locale('ar'),
        Locale('fa'),
        Locale("es"),
        Locale("it"),
      ],
      title: 'Organizer App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
          useMaterial3: true),
      home: HomeScreen(),
    );
  }

  Future<void> initialiseFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}