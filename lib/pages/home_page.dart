// home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../components/pin_item.dart';
import '../constants/app_colors.dart';
import '../models/pin.dart';
import '../providers/pin_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pinterestProvider = Provider.of<PinProvider>(context, listen: false);
    final List<PinModel> pins = pinterestProvider.pins;

    return Scaffold(
      body:  pins.isEmpty
          ? Center(child: LoadingAnimationWidget.inkDrop(color: AppColors.primaryColor, size: 30))
          : MasonryGridView.builder(
            itemCount: pins.length,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final PinModel pin = pins[index];
              return PinCard(pin: pin);
            },
          ),
    );
  }
}

