import 'dart:async';

import 'package:flutter/material.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/screens/welocme_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool bigLogo = false;
  late Timer _timer;

  Future navigateToWelcome() async {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        bigLogo = true;
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    });
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void initState() {
    navigateToWelcome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width(context, 0.05),
          ),
          alignment: Alignment.center,
          height: SizeConfig.height(context, 1),
          width: SizeConfig.width(context, 1),
          //color: Colors.yellow,
          child: (bigLogo == true)
              ? Image.asset("assets/logo_2.png",
              width: SizeConfig.width(context, 1))
              : Image.asset(
            "assets/logo.png",
            width: SizeConfig.width(context, 0.3),
          ),
        ),
      ),
    );
  }
}
