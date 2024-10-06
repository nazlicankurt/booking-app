import 'dart:convert';
import 'package:flutter_booking_app/core/errors/exceptions.dart';
import 'package:flutter_booking_app/core/utils/constants.dart';
import 'package:flutter_booking_app/src/hotels/data/datasources/hotel_remote_data_source.dart';
import 'package:flutter_booking_app/src/hotels/data/models/hotel_model.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late HotelRemoteDataSource remoteDataSource;

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  setUp(() {
    client = MockClient();
    remoteDataSource = HotelRemoteDataSourceImpl(client);
  });

  group('getHotels', () {
    final tHotels = [HotelModel.empty()];

    test('should return [List<HotelEntity>] when the status code is 200', () async {
      // Arrange
      when(() => client.get(any())).thenAnswer(
        (_) async => http.Response(jsonEncode([tHotels.first.toJson()]), 200),
      );

      // Act
      final result = await remoteDataSource.getHotels(
        name: 'name',
        destination: 'destination',
        adults: 1,
        children: 1,
        nights: 1,
        score: RatingInfo.empty(),
        images: [],
        bestOffer: BestOffer.empty(),
        analytics: HotelAnalyticsEntity.empty(),
      );

      // Assert
      expect(result, equals(tHotels));
      verify(() => client.get(Uri.parse(hotelsEndpoint))).called(1);
    });

    test('should throw an APIException when the status code is not 200', () async {
      // Arrange
      when(() => client.get(any())).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );

      // Act & Assert
      expect(
        () => remoteDataSource.getHotels(
          name: 'name',
          destination: 'destination',
          adults: 1,
          children: 1,
          nights: 1,
          score: RatingInfo.empty(),
          images: [],
          bestOffer: BestOffer.empty(),
          analytics: HotelAnalyticsEntity.empty(),
          
        ),
        throwsA(isA<APIException>()),
      );
      verify(() => client.get(Uri.parse(hotelsEndpoint))).called(1);
    });
  });
}
