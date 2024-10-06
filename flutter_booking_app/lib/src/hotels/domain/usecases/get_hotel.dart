import 'package:equatable/equatable.dart';
import 'package:flutter_booking_app/core/usecase/usecases.dart';
import 'package:flutter_booking_app/core/utils/typedef.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/image_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';
import 'package:flutter_booking_app/src/hotels/domain/repositories/hotel_repository.dart';

class GetHotelsUseCase extends UsecaseWithParams<List<HotelEntity>, GetHotelsParams> {
  final HotelRepository repository;

  const GetHotelsUseCase(this.repository);

  @override
  ResultFuture<List<HotelEntity>> call(GetHotelsParams params) {
    return repository.getHotels(
      name: params.name,
      destination: params.destination,
      adults: params.adults,
      children: params.children,
      nights: params.nights,
      score: params.score,
      images: params.images,
      bestOffer: params.bestOffer, 
      analytics: params.analytics, 
    );
  }
}

class GetHotelsParams extends Equatable {
  const GetHotelsParams({
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

   GetHotelsParams.empty()
      : name = '_empty.name',
        destination = '_empty.destination',
        adults = 0,
        children = 0,
        nights = 0,
        score = const RatingInfo.empty(),
        images = const [],
        bestOffer =  BestOffer.empty(),
        analytics =  const HotelAnalyticsEntity.empty(); 

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
  List<Object?> get props => [
    name,
    destination,
    adults,
    children,
    nights,
    score,
    images,
    bestOffer, 
    analytics, 
  ];
}
