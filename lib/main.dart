import 'package:flutter/material.dart';
import 'package:he_store/categories.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:he_store/firebase_options.dart';
import 'package:he_store/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: LoginPage());
  }
}
