import 'package:equatable/equatable.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/image_entity.dart';

abstract class HotelEvent extends Equatable {
  const HotelEvent();

  @override
  List<Object> get props => [];
}

class GetHotelsEvent extends HotelEvent {
  const GetHotelsEvent({
    required this.hotelId,
    required this.name,
    required this.destination,
    required this.adults,
    required this.children,
    required this.nights,
    required this.score,
    required this.images,
    required this.bestOffer,
    required this.analytics,
  });
  final String hotelId;
  final String name;
  final String destination;
  final int adults;
  final int children;
  final int nights;
  final RatingInfo score;
  final List<ImageEntity> images;
  final BestOffer bestOffer;
  final HotelAnalyticsEntity analytics;

  @override
  List<Object> get props =>
      [name, destination, adults, children, nights, score, images, bestOffer, analytics];
}

class GetHotelDetailsByIdEvent extends HotelEvent {
  final String hotelId;
  const GetHotelDetailsByIdEvent(this.hotelId);

  @override
  List<Object> get props => [hotelId];
}
