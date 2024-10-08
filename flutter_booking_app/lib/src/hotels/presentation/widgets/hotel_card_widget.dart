import 'package:flutter/material.dart';
import 'package:flutter_booking_app/core/presentation/widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'hotel_image.dart';
import 'hotel_info.dart';
import 'hotel_price_info.dart';

class HotelCardWidget extends StatelessWidget {
  final String hotelId;
  final String imageUrl;
  final String hotelName;
  final String hotelLocation;
  final int? day; // Optional for Favorites
  final int? night; // Optional for Favorites
  final String? roomType; // Optional for Favorites
  final String? meal; // Optional for Favorites
  final int? adults; // Optional for Favorites
  final int? children; // Optional for Favorites
  final double? pricePerPerson; // Optional for Favorites
  final double? totalPrice; // Optional for Favorites
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final String buttonText;

  // Named constructor for Hotels view (full details)
  const HotelCardWidget.hotel({
    Key? key,
    required this.hotelId,
    required this.imageUrl,
    required this.hotelName,
    required this.hotelLocation,
    required this.day,
    required this.night,
    required this.roomType,
    required this.meal,
    required this.adults,
    required this.children,
    required this.pricePerPerson,
    required this.totalPrice,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.buttonText,
  }) : super(key: key);

  // Named constructor for Favorites view (less details)
  const HotelCardWidget.favorite({
    Key? key,
    required this.hotelId,
    required this.imageUrl,
    required this.hotelName,
    required this.hotelLocation,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.buttonText,
  })  : day = null,
        night = null,
        roomType = null,
        meal = null,
        adults = null,
        children = null,
        pricePerPerson = null,
        totalPrice = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context)!;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HotelImage(
            imageUrl: imageUrl,
            isFavorite: isFavorite,
            onFavoriteToggle: onFavoriteToggle,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HotelInfo(
                  hotelName: hotelName,
                  hotelLocation: hotelLocation,
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                ),
                if (day != null && night != null && roomType != null) ...[
                  const Divider(height: 20, thickness: 1),
                  HotelPriceInfo(
                    day: day!,
                    roomType: roomType!,
                    meal: meal!,
                    adults: adults!,
                    children: children!,
                    pricePerPerson: pricePerPerson!,
                    totalPrice: totalPrice!,
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                    localizations: localizations,
                  ),
                ],
                const SizedBox(height: 12),
                CustomButton(
                  text: buttonText,
                  onPressed: () {},
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
