import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modarakia/pages/EnfantPage.dart';
import 'package:modarakia/pages/HommePage.dart';
import 'package:modarakia/pages/FemmePage.dart';
import 'package:modarakia/utils/constants.dart';

import 'firebase_options.dart';
import 'pages/genderPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        fontFamily: 'Baloo bhaijaan 2',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: {
        '/gender': (context) => const GenderPage(),
        '/femme': (context) => FemmePage(),
        '/homme': (context) => const HommePage(),
        '/enfant': (context) => const EnfantPage(),
      },
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(context, '/gender'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
