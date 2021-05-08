import 'package:dhonkolhu/src/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dhonkolhu',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Ubuntu'),
        primaryColor: Colors.white,
        accentColor: Colors.pink,
      ),
      home: SplashScreen(),
    );
  }
}
