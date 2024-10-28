import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinterest/constants/app_colors.dart';
import '../pages/home_page.dart';
import '../providers/pin_provider.dart';
import 'home_screen.dart';
import 'dart:async';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  beforeSplash(BuildContext c) async {
    PinProvider pinProvider = Provider.of(context, listen: false,);
      await pinProvider.fechPins();
      await Future.delayed(const Duration(seconds: 1));
  }
  @override
  void initState() {
    super.initState();
    beforeSplash(context).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/spl_logo.png', width: 160,height: 160,),
            SizedBox(height: 10),
            LoadingAnimationWidget.inkDrop(color: AppColors.primaryColor, size: 30),
          ],
        ),

      ),
    );
  }
}
