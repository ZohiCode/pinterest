import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../models/pin.dart';

class PinCard extends StatelessWidget {
  const PinCard({super.key, required this.pin });
  final PinModel pin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: pin.imageUrl!,
                cacheKey: pin.id.toString(),
                placeholder: (context, url) => LoadingAnimationWidget.fallingDot(
                  color: Colors.grey,
                  size: 30,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageBuilder: (context, imageProvider) => ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
            ),
          ],
        ),
      ),
    );
  }
}
