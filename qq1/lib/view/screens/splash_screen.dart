import 'package:flutter/material.dart';
import 'package:qq1/view/screens/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToFirstPage();
  }

  _navigateToFirstPage() async {
    await Future.delayed(const Duration(milliseconds: 2200), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
              width: 450,
              height: 450,
              child: Image.asset('Assets/logo_quiz_app.png')),
        ]),
      ),
    );
  }
}
