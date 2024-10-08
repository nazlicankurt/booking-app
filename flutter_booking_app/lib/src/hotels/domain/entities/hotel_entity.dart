import 'package:equatable/equatable.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/image_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';

class HotelEntity extends Equatable {
  final String hotelId;
  final int category;
  final String categoryType;
  final String destination;
  final double latitude;
  final double longitude;
  final String name;
  final BestOffer bestOffer;
  final List<ImageEntity> images;
  final RatingInfo ratingInfo;
  final HotelAnalyticsEntity analytics;

  const HotelEntity(
      {
      required this.hotelId,
      required this.category,
      required this.categoryType,
      required this.destination,
      required this.latitude,
      required this.longitude,
      required this.name,
      required this.bestOffer,
      required this.images,
      required this.ratingInfo,
      required this.analytics});

  @override
  List<Object?> get props => [hotelId];
}
