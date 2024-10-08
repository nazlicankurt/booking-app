import 'package:dartz/dartz.dart';
import 'package:flutter_booking_app/src/hotels/data/datasources/hotel_local_data_source.dart';
import 'package:flutter_booking_app/src/hotels/data/datasources/hotel_remote_data_source.dart';
import 'package:flutter_booking_app/src/hotels/data/repositories/hotel_repository_impl.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_booking_app/core/errors/failure.dart';
import 'package:flutter_booking_app/core/errors/exceptions.dart';

class MockHotelRemoteDataSource extends Mock implements HotelRemoteDataSource {}

void main() {
  late HotelRemoteDataSource remoteDataSource;
  late HotelLocalDataSource localeDataSource;
  late HotelRepositoryImpl repoImpl;

  setUpAll(() {
    registerFallbackValue(RatingInfo(
      recommendationRate: 0,
      reviewsCount: 0,
      score: 0,
      scoreDescription: '',
    ));
  });

  setUp(() {
    remoteDataSource = MockHotelRemoteDataSource();
    localeDataSource = MockHotelLocalDataSource() as HotelLocalDataSource;
    repoImpl = HotelRepositoryImpl(remoteDataSource, localeDataSource);
  });

  group('getHotels', () {
    test('should call the RemoteDataSource.getHotels and return List<Hotel>',
        () async {
      // Arrange
      when(() => remoteDataSource.getHotels(
            hotelId: any(named: 'hotelId'),
            name: any(named: 'name'),
            destination: any(named: 'destination'),
            adults: any(named: 'adults'),
            children: any(named: 'children'),
            nights: any(named: 'nights'),
            score: any(named: 'score'),
            images: any(named: 'images'),
            bestOffer: any(named: 'bestOffer'),
            analytics: any(named: 'analytics'),
          )).thenAnswer((_) async => []);

      // Act
      final result = await repoImpl.getHotels(
        hotelId: 'hotelId',
        name: 'name',
        destination: 'destination',
        adults: 1,
        children: 1,
        nights: 1,
        score: RatingInfo(
          recommendationRate: 4,
          reviewsCount: 100,
          score: 4,
          scoreDescription: "Test",
        ),
        images: [],
        bestOffer: BestOffer.empty(),
        analytics: HotelAnalyticsEntity.empty(),
      );

      // Assert
      expect(result, isA<Right<dynamic, List<HotelEntity>>>());
      verify(() => remoteDataSource.getHotels(
            hotelId: 'hotelId',
            name: 'name',
            destination: 'destination',
            adults: 1,
            children: 1,
            nights: 1,
            score: RatingInfo(
              recommendationRate: 4,
              reviewsCount: 100,
              score: 4,
              scoreDescription: "Test",
            ),
            images: [],
            bestOffer: BestOffer.empty(), 
            analytics: HotelAnalyticsEntity.empty(), 
          )).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test(
        'should return an [ApiFailure] when the call to the remote source is unsuccessful',
        () async {
      // Arrange
      when(() => remoteDataSource.getHotels(
                hotelId: any(named: 'hotelId'),
                name: any(named: 'name'),
                destination: any(named: 'destination'),
                adults: any(named: 'adults'),
                children: any(named: 'children'),
                nights: any(named: 'nights'),
                score: any(named: 'score'),
                images: any(named: 'images'),
                bestOffer: any(named: 'bestOffer'),
                analytics: any(named: 'analytics'),
              ))
          .thenThrow(
              APIException(message: 'Error fetching hotels', statusCode: 500));

      // Act
      final result = await repoImpl.getHotels(
        hotelId: 'hotelId',
        name: 'name',
        destination: 'destination',
        adults: 1,
        children: 1,
        nights: 1,
        score: RatingInfo(
          recommendationRate: 4,
          reviewsCount: 100,
          score: 4,
          scoreDescription: "Test",
        ),
        images: [],
        bestOffer: BestOffer.empty(),
        analytics: HotelAnalyticsEntity.empty(),
      );

      // Assert
      expect(
          result,
          equals(Left(ApiFailure.fromException(const APIException(
            message: 'Error fetching hotels',
            statusCode: 500,
          )))));

      verify(() => remoteDataSource.getHotels(
            hotelId: 'hotelId',
            name: 'name',
            destination: 'destination',
            adults: 1,
            children: 1,
            nights: 1,
            score: RatingInfo(
              recommendationRate: 4,
              reviewsCount: 100,
              score: 4,
              scoreDescription: "Test",
            ),
            images: [],
            bestOffer: BestOffer.empty(),
            analytics: HotelAnalyticsEntity.empty(),
          )).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}

class MockHotelLocalDataSource {
}