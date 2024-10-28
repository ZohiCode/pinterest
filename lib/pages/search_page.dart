// search_page.dart
import 'package:flutter/material.dart';
import 'package:pinterest/constants/app_colors.dart';
import 'package:pinterest/screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../providers/pin_provider.dart';
import 'home_page.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  Future<void> _searchPins(BuildContext context) async {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      // Wait for the pins to be updated
      await Provider.of<PinProvider>(context, listen: false).SearchPins(query);
      // Navigate to HomePage only after the pins have been updated
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Ara...',
                    hintStyle: TextStyle(color: AppColors.textGrayColor),
                    prefixIcon: Icon(Icons.search, color: AppColors.textGrayColor),
                    prefixIconColor: Colors.grey,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.borderColor),
                    ),
                    fillColor: Colors.white,
                  ),
                  onSubmitted: (_) => _searchPins(context),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: Text(
                    'Search Page Content Here',
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
