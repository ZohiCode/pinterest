import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest/providers/pin_provider.dart';
import '../components/pin_item.dart';
import '../models/pin.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final UserProvider profileProvider = UserProvider();
  late final Profile profile = profileProvider.profile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(profile.avatarUrl),
              ),
              SizedBox(height: 16), // Aralık
              // Kullanıcı Adı
              Text(
                profile.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              // Bio
              Text(
                profile.username,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: Text(
                    'Profile Page Content Here',
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
