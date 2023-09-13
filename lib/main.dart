import 'package:flutter/material.dart';
import 'package:metabooth/screens/add_device_screen.dart';
import 'package:metabooth/screens/color.dart';
import 'package:metabooth/screens/color_picker_screen.dart';
import 'package:metabooth/screens/welocme_screen.dart';
import 'package:metabooth/screens/login_or_register_screen.dart';
import 'package:metabooth/screens/login_screen.dart';
import 'package:metabooth/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}
