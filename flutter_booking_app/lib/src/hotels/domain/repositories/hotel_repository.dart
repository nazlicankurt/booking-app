import 'package:flutter_booking_app/core/utils/typedef.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/image_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';
abstract class HotelRepository {
  const HotelRepository();

  ResultFuture<List<HotelEntity>> getHotels({
    required String name,
    required String destination,
    required int adults,
    required int children,
    required int nights,
    required RatingInfo score,
    required List<ImageEntity> images,
    required BestOffer bestOffer, 
    required HotelAnalyticsEntity analytics, 
  });

  ResultFuture<void> saveFavoriteHotel(HotelEntity hotel);
  ResultFuture<void> removeFavoriteHotel(String hotelId);
  ResultFuture<List<HotelEntity>> getFavoriteHotels();
}
