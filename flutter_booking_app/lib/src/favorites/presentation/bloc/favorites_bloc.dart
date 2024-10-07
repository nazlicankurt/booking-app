import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_event.dart';
import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_state.dart';
import 'package:flutter_booking_app/core/errors/failure.dart';
import 'package:flutter_booking_app/src/hotels/domain/usecases/get_saved_hotel.dart';
import 'package:flutter_booking_app/src/hotels/domain/usecases/remove_hotel.dart';
import 'package:flutter_booking_app/src/hotels/domain/usecases/save_hotel.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final SaveFavoriteHotelUseCase saveFavoriteHotelUseCase;
  final RemoveFavoriteHotelUseCase removeFavoriteHotelUseCase;
  final GetFavoriteHotelsUseCase getFavoriteHotelsUseCase;

  FavoritesBloc({
    required this.saveFavoriteHotelUseCase,
    required this.removeFavoriteHotelUseCase,
    required this.getFavoriteHotelsUseCase,
  }) : super(FavoritesInitial()) {
    on<AddFavorite>((event, emit) async {
      if (state is FavoritesLoaded) {
        final currentState = state as FavoritesLoaded;

        emit(FavoritesLoaded([...currentState.favoriteHotels, event.hotel]));

        final result = await saveFavoriteHotelUseCase(event.hotel);
        result.fold(
          (failure) {
            emit(FavoritesError(_mapFailureToMessage(failure)));
            emit(currentState); 
          },
          (_) => {},
        );
      }
    });

    on<RemoveFavorite>((event, emit) async {
      if (state is FavoritesLoaded) {
        final currentState = state as FavoritesLoaded;

        emit(FavoritesLoaded(currentState.favoriteHotels
            .where((hotel) => hotel.hotelId != event.hotelId)
            .toList()));

        final result = await removeFavoriteHotelUseCase(event.hotelId);
        result.fold(
          (failure) {
            emit(FavoritesError(_mapFailureToMessage(failure)));
            emit(currentState); 
          },
          (_) => {}, 
        );
      }
    });

    on<FetchFavorites>((event, emit) async {
      emit(FavoritesLoading());
      final result = await getFavoriteHotelsUseCase();
      result.fold(
        (failure) => emit(FavoritesError(_mapFailureToMessage(failure))),
        (favoriteHotels) => emit(FavoritesLoaded(favoriteHotels)),
      );
    });

    add(FetchFavorites());
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is DatabaseFailure) {
      return 'Database error occurred';
    } else {
      return 'An unexpected error occurred';
    }
  }
}
