import 'package:first_app/category_screen.dart';
import 'package:first_app/language_screen.dart';
import 'package:first_app/phone_screen.dart';
import 'package:first_app/state.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => DataState(),
    child: MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: LanguageScreen(),
      routes: {
        PhoneScreen.routeName: (context) => PhoneScreen(),
        CategoryScreen.routeName: (context) => CategoryScreen(),
      },
    ),
  ));
}
