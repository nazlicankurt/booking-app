import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_booking_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_booking_app/core/presentation/widgets/loading_skeleton.dart';
import 'package:flutter_booking_app/core/presentation/widgets/not_found_widget.dart';
import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_event.dart';
import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_state.dart';
import 'package:flutter_booking_app/src/hotels/presentation/widgets/hotel_card_widget.dart';

@RoutePage()
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Favorites'),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const CustomLoadingSkeleton();
          } else if (state is FavoritesLoaded) {
            if (state.favoriteHotels.isEmpty) {
              return const CustomEmptyState(
                message: 'No favorites added yet.',
                lottieAssetPath: 'assets/animations/Lottie3.json',
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.favoriteHotels.length,
                itemBuilder: (context, index) {
                  final hotel = state.favoriteHotels[index];

                  return HotelCardWidget.favorite(
                    hotelId: hotel.hotelId,
                    imageUrl:
                        hotel.images.isNotEmpty ? hotel.images[0].small : '',
                    hotelName: hotel.name,
                    hotelLocation: hotel.destination,
                    isFavorite: true,
                    onFavoriteToggle: () {
                      BlocProvider.of<FavoritesBloc>(context)
                          .add(RemoveFavorite(hotel.hotelId));
                    },
                    buttonText: 'Zum Hotel',
                  );
                },
              ),
            );
          } else if (state is FavoritesError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
