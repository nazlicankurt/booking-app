import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_booking_app/src/homepage/presentation/widgets/home_carousel.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/image_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';

@RoutePage()
class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HotelEntity> hotels = [
      HotelEntity(
        category: 4,
        categoryType: "dots",
        destination: "Cala Millor, Mallorca, Spanien",
        hotelId: "3182-giata",
        latitude: 39.59083,
        longitude: 3.3835392,
        name: "allsun Hotel Sumba",
        bestOffer: BestOffer.empty(),
        images: [
          ImageEntity(
              large: "https://picsum.photos/200/300",
              small: "https://picsum.photos/200/300"),
        ],
        ratingInfo: RatingInfo(
          recommendationRate: 0,
          reviewsCount: 1121,
          score: 4.4,
          scoreDescription: "Ausgezeichnet",
        ),
        analytics: HotelAnalyticsEntity.empty(),
      ),
      HotelEntity(
          category: 4,
          categoryType: "dots",
          destination: "Cala Millor, Mallorca, Spanien",
          hotelId: "3183-giata",
          latitude: 39.59083,
          longitude: 3.3835392,
          name: "allsun Hotel Sumba",
          bestOffer: BestOffer.empty(),
          images: [
            ImageEntity(
                large: "https://picsum.photos/seed/picsum/200/300",
                small: "https://picsum.photos/seed/picsum/200/300"),
          ],
          ratingInfo: RatingInfo(
            recommendationRate: 0,
            reviewsCount: 1121,
            score: 4.0,
            scoreDescription: "Gut",
          ),
          analytics: HotelAnalyticsEntity.empty()),
    ];

    return Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Popular Hotels',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(child: HotelCarousel(hotels: hotels)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
