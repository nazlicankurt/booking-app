import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelImage extends StatelessWidget {
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const HotelImage({
    super.key,
    required this.imageUrl,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: FaIcon(
                isFavorite
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart,
                color: isFavorite ? Colors.red : Colors.grey[300],
              ),
              onPressed: onFavoriteToggle,
            ),
          ),
        ],
      ),
    );
  }
}
