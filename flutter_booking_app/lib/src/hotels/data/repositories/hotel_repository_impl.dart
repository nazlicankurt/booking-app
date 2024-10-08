import 'package:dartz/dartz.dart';
import 'package:flutter_booking_app/core/errors/exceptions.dart';
import 'package:flutter_booking_app/core/errors/failure.dart';
import 'package:flutter_booking_app/core/utils/typedef.dart';
import 'package:flutter_booking_app/src/hotels/data/datasources/hotel_remote_data_source.dart';
import 'package:flutter_booking_app/src/hotels/data/datasources/hotel_local_data_source.dart'; 
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/image_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/repositories/hotel_repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  const HotelRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final HotelRemoteDataSource _remoteDataSource;
  final HotelLocalDataSource _localDataSource;

  @override
  ResultFuture<List<HotelEntity>> getHotels({
    required String hotelId,
    required String name,
    required String destination,
    required int adults,
    required int children,
    required int nights,
    required RatingInfo score,
    required List<ImageEntity> images,
    required HotelAnalyticsEntity analytics,
    required BestOffer bestOffer,
  }) async {
    try {
      final result = await _remoteDataSource.getHotels(
        hotelId: hotelId,
        name: name,
        destination: destination,
        adults: adults,
        children: children,
        nights: nights,
        score: score,
        images: images,
        analytics: analytics,
        bestOffer: bestOffer,
      );
      return Right(result);
    } on APIException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> removeFavoriteHotel(String hotelId) async {
    try {
      await _localDataSource.removeFavoriteHotel(hotelId);
      return const Right(null); 
    } catch (e) {
      return Left(DatabaseFailure(message: 'Failed to remove favorite hotel', statusCode: 500));
    }
  }
  @override
  ResultFuture<void> saveFavoriteHotel(HotelEntity hotel) async {
    try {
      await _localDataSource.saveFavoriteHotel(hotel.hotelId);
      return const Right(null); 
    } catch (e) {
      return Left(DatabaseFailure(message: 'Failed to save favorite hotel', statusCode: 500));
    }
  }

  @override
  ResultFuture<List<HotelEntity>> getFavoriteHotels() async {
    try {
      final favoriteHotelIds = await _localDataSource.getFavoriteHotels();
      final hotels = await _remoteDataSource.getHotels(
        hotelId: '',
        name: '', 
        destination: '', 
        adults: 0, 
        children: 0, 
        nights: 0, 
        score: RatingInfo.empty(), 
        images: [], 
        analytics: HotelAnalyticsEntity.empty(), 
        bestOffer: BestOffer.empty(),
      );
      final favoriteHotels = hotels
          .where((hotel) => favoriteHotelIds.contains(hotel.hotelId))
          .map((hotelModel) => hotelModel)
          .toList();
      return Right(favoriteHotels);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Failed to get favorite hotels', statusCode: 500));
    }
  }
}