import 'package:dartz/dartz.dart';
import 'package:flutter_booking_app/core/errors/exceptions.dart';
import 'package:flutter_booking_app/core/errors/failure.dart';
import 'package:flutter_booking_app/core/utils/typedef.dart';
import 'package:flutter_booking_app/src/hotels/data/datasources/hotel_remote_data_source.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/image_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/repositories/hotel_repository.dart';

class HotelRepositoryImpl implements HotelRepository {

  const HotelRepositoryImpl(this._remoteDataSource);
  final HotelRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<HotelEntity>> getHotels({
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
    //Test-Driven Dev
    // are we calling remote data source?
    //check if the method return the proper data
    // // check if when the remote data source throws an exception, we return a failure
    //and if it does not throw an exception we return the actual data successfully
    // TODO: implement getHotels
    try {
      final result = await _remoteDataSource.getHotels(
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




}
