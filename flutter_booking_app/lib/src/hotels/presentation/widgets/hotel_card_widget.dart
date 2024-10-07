import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_booking_app/core/presentation/widgets/custom_button.dart';

class HotelCardWidget extends StatelessWidget {
  final String hotelId;
  final String imageUrl;
  final String hotelName;
  final String hotelLocation;
  final int day;
  final int night;
  final String roomType;
  final String meal;
  final int adults;
  final int children;
  final String flightIncluded;
  final double pricePerPerson;
  final double totalPrice;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const HotelCardWidget({
    super.key,
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
    required this.flightIncluded,
    required this.pricePerPerson,
    required this.totalPrice,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;
  final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
       color: colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          _buildDetails(context, textTheme, localizations),
        ],
      ),
    );
  }

  Widget _buildImage() {
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

  Widget _buildRating(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            return FaIcon(
              FontAwesomeIcons.solidStar,
              color: Theme.of(context).colorScheme.primary,
              size: 16,
            );
          }),
        ),
        const SizedBox(width: 8),
        FaIcon(
          FontAwesomeIcons.circleQuestion,
          size: 16,
          color: Colors.grey[600],
        ),
      ],
    );
  }

  Widget _buildHotelInfo(BuildContext context,TextTheme textTheme) {
    final colorScheme = Theme.of(context).colorScheme;

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
          hotelLocation,   style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }


  Widget _buildDetails(BuildContext context, TextTheme textTheme,
      AppLocalizations localizations) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRating(context),
          const SizedBox(height: 8),
   _buildHotelInfo(context, textTheme),
          const Divider(height: 20, thickness: 1),
          _buildStayInfoAndPrice(
              context, textTheme, localizations), 
          const SizedBox(height: 12),
          _buildActionButton(context, localizations),
        ],
      ),
    );
  }

  Widget _buildStayInfoAndPrice(BuildContext context, TextTheme textTheme,
      AppLocalizations localizations) {
      final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(localizations.days(day),
                    style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.7),),),
              const SizedBox(height: 2),
              Text('${roomType.split('/').first} | $meal',
                   style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.7),),
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text(localizations.guests(adults, children),
                    style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.7),),),
              const SizedBox(height: 8),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${localizations.priceAb} ', 
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  TextSpan(
                    text: '$totalPrice €',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                 color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '$pricePerPerson € p.P.',
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(
      BuildContext context, AppLocalizations localizations) {
    return CustomButton(
      text: localizations.offers,
      onPressed: () {},
      width: MediaQuery.of(context).size.width ,
    );
  }
}
