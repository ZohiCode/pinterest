import 'package:flutter/material.dart';
import 'package:pinterest/providers/user_provider.dart';
import 'package:pinterest/screen/splash_screen.dart';
import 'package:pinterest/providers/pin_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PinProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinterest Clone',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    );
  }
}
