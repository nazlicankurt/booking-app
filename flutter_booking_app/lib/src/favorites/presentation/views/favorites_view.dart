import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_booking_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_event.dart';
import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_state.dart';
import 'package:flutter_booking_app/src/hotels/presentation/widgets/hotel_card_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
            return Padding(
              padding: const EdgeInsets.all(12.0), 
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Skeletonizer(
                    child: HotelCardWidget(
                      hotelId: '',
                      hotelName: '',
                      hotelLocation: '',
                      imageUrl: '',
                      day: 0,
                      night: 0,
                      roomType: '',
                      meal: '',
                      adults: 0,
                      children: 0,
                      flightIncluded: '',
                      pricePerPerson: 0,
                      totalPrice: 0,
                      isFavorite: false,
                      onFavoriteToggle: () {},
                    ),
                  );
                },
              ),
            );
          } else if (state is FavoritesLoaded) {
            if (state.favoriteHotels.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animations/Lottie3.json', 
                      width: 300,
                      height: 200,
                      repeat: true,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'No favorites added yet.',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0), 
              child: ListView.builder(
                itemCount: state.favoriteHotels.length,
                itemBuilder: (context, index) {
                  final hotel = state.favoriteHotels[index];

                  return HotelCardWidget(
                    hotelId: hotel.hotelId,
                    hotelName: hotel.name,
                    hotelLocation: hotel.destination,
                    imageUrl:
                        hotel.images.isNotEmpty ? hotel.images[0].large : '',
                    day: hotel.bestOffer.days,
                    night: hotel.bestOffer.nights,
                    roomType: hotel.bestOffer.room.roomType,
                    meal: hotel.bestOffer.room.roomType,
                    adults: hotel.bestOffer.room.adultCount,
                    children: hotel.bestOffer.room.childCount,
                    flightIncluded: hotel.bestOffer.flightIncluded
                        ? 'inkl. Flug'
                        : 'ohne Flug',
                    pricePerPerson: hotel.bestOffer.simplePricePerPerson / 100,
                    totalPrice: hotel.bestOffer.originalTravelPrice / 100,
                    isFavorite: true,
                    onFavoriteToggle: () {
                      BlocProvider.of<FavoritesBloc>(context)
                          .add(RemoveFavorite(hotel.hotelId));
                    },
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
