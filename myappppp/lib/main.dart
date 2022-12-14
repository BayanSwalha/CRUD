import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myappppp/firebase_options.dart';

import 'LogIn.dart/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

// Ideal time to initialize
//...
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LogIn();
  }
}
