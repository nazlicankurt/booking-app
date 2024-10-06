import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_booking_app/core/errors/failure.dart';
import 'package:flutter_booking_app/src/hotels/domain/usecases/get_hotel.dart';
import 'hotel_event.dart';
import 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc({
    required GetHotelsUseCase getHotels,
  })  : _getHotels = getHotels,
        super(HotelInitial()) {
    on<GetHotelsEvent>(_getHotelsHandler);
  }

  final GetHotelsUseCase _getHotels;

  Future<void> _getHotelsHandler(
      GetHotelsEvent event, Emitter<HotelState> emit) async {
    emit(HotelLoading());
    
    final result = await _getHotels(GetHotelsParams(
      name: event.name,
      destination: event.destination,
      adults: event.adults,
      children: event.children,
      nights: event.nights,
      score: event.score,
      images: event.images,
      analytics: event.analytics,
      bestOffer: event.bestOffer,

    ));
    result.fold(
      (failure) {
        final errorMessage = _mapFailureToMessage(failure);
        emit(HotelError(errorMessage));
      },
      (hotels) => emit(HotelsLoaded(hotels)),
    
    );
  }

  String _mapFailureToMessage(Failure failure) {
    // You can expand this with more specific error messages based on the failure type
    if (failure is ApiFailure) {
      return failure.message;
    } else {
      return 'Unexpected error';
    }
  }
}
