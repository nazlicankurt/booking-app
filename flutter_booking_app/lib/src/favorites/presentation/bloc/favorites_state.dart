import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<HotelEntity> favoriteHotels;
  FavoritesLoaded(this.favoriteHotels);
}

class FavoritesError extends FavoritesState {
  final String message;
  FavoritesError(this.message);
}
