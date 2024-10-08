import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HotelPriceInfo extends StatelessWidget {
  final int day;
  final String roomType;
  final String meal;
  final int adults;
  final int children;
  final double pricePerPerson;
  final double totalPrice;
  final TextTheme textTheme;         
  final AppLocalizations localizations; 
  final ColorScheme colorScheme;   

  const HotelPriceInfo({
    Key? key,
    required this.day,
    required this.roomType,
    required this.meal,
    required this.adults,
    required this.children,
    required this.pricePerPerson,
    required this.totalPrice,
    required this.textTheme,       
    required this.localizations,   
    required this.colorScheme,     
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizations.days(day),
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '${roomType.split('/').first} | $meal',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                localizations.guests(adults, children),
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
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
}
