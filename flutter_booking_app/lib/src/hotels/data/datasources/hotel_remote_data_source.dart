import 'dart:convert';

import 'package:flutter_booking_app/core/errors/exceptions.dart';
import 'package:flutter_booking_app/core/utils/constants.dart';
import 'package:flutter_booking_app/src/hotels/data/models/hotel_model.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/image_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';
import 'package:http/http.dart' as http;

abstract class HotelRemoteDataSource {
  const HotelRemoteDataSource();

  Future<List<HotelModel>> getHotels({
    required String name,
    required String destination,
    required int adults,
    required int children,
    required int nights,
    required RatingInfo score,
    required List<ImageEntity> images,
    required HotelAnalyticsEntity analytics,
    required BestOffer bestOffer,
  });

}

class HotelRemoteDataSourceImpl implements HotelRemoteDataSource {
  const HotelRemoteDataSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<List<HotelModel>> getHotels({
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
    final response = await _client.get(Uri.parse(hotelsEndpoint));
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);


      if (jsonData.containsKey('hotels')) {
        final List<dynamic> hotelsData = jsonData['hotels'];

        return hotelsData
            .map((hotel) => HotelModel.fromJson(hotel as Map<String, dynamic>))
            .toList();
      } else {
        throw APIException(
            message: 'No hotel data found in response', statusCode: 500);
      }
    } else {
      throw APIException(
        message: 'Error fetching hotels',
        statusCode: response.statusCode,
      );
    }
  }

}
