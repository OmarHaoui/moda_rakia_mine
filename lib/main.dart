import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:modarakia/pages/EnfantPage.dart';
import 'package:modarakia/pages/HommePage.dart';
import 'package:modarakia/pages/FemmePage.dart';
import 'package:modarakia/result.dart';

import 'pages/genderPage.dart';
import 'utils/widgets.dart';

void main() {
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
      backgroundColor: const Color(0xff1c1c37),
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: MediaQuery.of(context).size.width - 50,
        ),
      ),
    );
  }
}
