import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';

abstract class FavoritesEvent {}

class AddFavorite extends FavoritesEvent {
  final HotelEntity hotel;
  AddFavorite(this.hotel);
}

class RemoveFavorite extends FavoritesEvent {
  final String hotelId;
  RemoveFavorite(this.hotelId);
}

class FetchFavorites extends FavoritesEvent {}
