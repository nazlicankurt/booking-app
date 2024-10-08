import 'package:flutter_booking_app/core/errors/failure.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/image_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/room_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/repositories/hotel_repository.dart';
import 'package:flutter_booking_app/src/hotels/domain/usecases/get_hotel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockHotelRepo extends Mock implements HotelRepository {}

void main() {
  late HotelRepository repository;
  late GetHotelsUseCase usecase;

  setUp(() {
    repository = MockHotelRepo();
    usecase = GetHotelsUseCase(repository);
  });

  test(
    'should return a list of hotels when the repository call is successful',
    () async {
      // Arrange
      var testParams = GetHotelsParams(
          hotelId: '123',
          name: 'Test Hotel',
          destination: 'Test Destination',
          adults: 2,
          children: 0,
          nights: 3,
          score: RatingInfo.empty(),
          images: const [],
          bestOffer: BestOffer.empty(),
          analytics: HotelAnalyticsEntity.empty());

      final testResponse = [
        HotelEntity(
          hotelId: '123',
          name: 'Paris Hotel',
          destination: 'Paris',
          latitude: 48.8566,
          longitude: 2.3522,
          images: const [ImageEntity(large: 'large_url', small: 'small_url')],
          ratingInfo: RatingInfo.empty(),
          category: 3,
          bestOffer: BestOffer.empty(),
          categoryType: '',
          analytics: HotelAnalyticsEntity.empty(),
        )
      ];

      when(() => repository.getHotels(
            hotelId: testParams.hotelId,
            name: testParams.name,
            destination: testParams.destination,
            adults: testParams.adults,
            children: testParams.children,
            nights: testParams.nights,
            score: testParams.score,
            images: testParams.images,
            bestOffer: testParams.bestOffer,
            analytics: testParams.analytics,
          )).thenAnswer((_) async => Right(testResponse));

      // Act
      final result = await usecase.call(testParams);

      // Assert
      expect(result, equals(Right(testResponse)));
      verify(() => repository.getHotels(
            hotelId: testParams.hotelId,
            name: testParams.name,
            destination: testParams.destination,
            adults: testParams.adults,
            children: testParams.children,
            nights: testParams.nights,
            score: testParams.score,
            images: testParams.images,
            bestOffer: testParams.bestOffer,
            analytics: testParams.analytics,
          )).called(1);
      verifyNoMoreInteractions(repository);
    },
  );

  test(
    'should return a Failure when repository call fails',
    () async {
      // Arrange
      var testParams = GetHotelsParams(
        hotelId: '123',
        name: 'Test Hotel',
        destination: 'Test Destination',
        adults: 2,
        children: 0,
        nights: 3,
        score: const RatingInfo(
          recommendationRate: 4.5,
          reviewsCount: 200,
          score: 4.8,
          scoreDescription: 'Excellent',
        ),
        images: const [],
        bestOffer: BestOffer.empty(),
        analytics: const HotelAnalyticsEntity.empty(),
      );

      when(() => repository.getHotels(
                hotelId: testParams.hotelId,
                name: testParams.name,
                destination: testParams.destination,
                adults: testParams.adults,
                children: testParams.children,
                nights: testParams.nights,
                score: testParams.score,
                images: testParams.images,
                bestOffer: testParams.bestOffer,
                analytics: testParams.analytics,
              ))
          .thenAnswer((_) async =>
              const Left(ApiFailure(message: 'Error', statusCode: 500)));

      // Act
      final result = await usecase.call(testParams);

      // Assert
      expect(result,
          equals(const Left(ApiFailure(message: 'Error', statusCode: 500))));
      verify(() => repository.getHotels(
            hotelId: testParams.hotelId,
            name: testParams.name,
            destination: testParams.destination,
            adults: testParams.adults,
            children: testParams.children,
            nights: testParams.nights,
            score: testParams.score,
            images: testParams.images,
            bestOffer: testParams.bestOffer,
            analytics: testParams.analytics,
          )).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
