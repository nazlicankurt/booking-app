import 'package:equatable/equatable.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';

abstract class HotelState extends Equatable {
  const HotelState();
  @override
  List<Object?> get props => [];
}

class HotelInitial extends HotelState {
  const HotelInitial();
}

class HotelLoading extends HotelState {
  const HotelLoading();
}

class HotelsLoaded extends HotelState {
  final List<HotelEntity> hotels;
  const HotelsLoaded(this.hotels);

  @override
  List<Object?> get props => [hotels];
}

class HotelError extends HotelState {
  final String message;
  const HotelError(this.message);

  @override
  List<Object?> get props => [message];
}
