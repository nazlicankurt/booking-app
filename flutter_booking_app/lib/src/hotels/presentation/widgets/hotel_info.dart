import 'package:flutter/material.dart';
class HotelInfo extends StatelessWidget {
  final String hotelName;
  final String hotelLocation;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const HotelInfo({
    super.key,
    required this.hotelName,
    required this.hotelLocation,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotelName,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          hotelLocation,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
