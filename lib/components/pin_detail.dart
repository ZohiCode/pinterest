import 'package:flutter/material.dart';

class PinDetail extends StatelessWidget {
  const PinDetail({super.key, required this.pin});

  final dynamic pin;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('Pin Detail Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
