import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_booking_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_event.dart';
import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_state.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';
import 'package:flutter_booking_app/src/hotels/presentation/bloc/hotel_event.dart';
import 'package:flutter_booking_app/src/hotels/presentation/bloc/hotel_state.dart';
import 'package:flutter_booking_app/src/hotels/presentation/widgets/hotel_card_widget.dart';
import 'package:flutter_booking_app/src/homepage/presentation/bloc/hotel_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class HotelsView extends StatefulWidget {
  const HotelsView({super.key});

  @override
  _HotelsViewState createState() => _HotelsViewState();
}

class _HotelsViewState extends State<HotelsView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<HotelBloc>(context).add(GetHotelsEvent(
      name: "",
      destination: "",
      adults: 2,
      children: 0,
      nights: 3,
      score: RatingInfo.empty(),
      images: [],
      bestOffer: BestOffer.empty(),
      analytics: HotelAnalyticsEntity.empty(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Hotels'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<HotelBloc, HotelState>(
          builder: (context, hotelState) {
            if (hotelState is HotelLoading) {
              return ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Skeletonizer(
                      child: Container(
                        height: 100,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              );
            } else if (hotelState is HotelsLoaded) {
              if (hotelState.hotels.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/animations/Lottie1.json',
                        width: 200,
                        height: 200,
                        repeat: false,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'No hotels found.',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                );
              }

              return BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, favoritesState) {
                  final favoriteHotels = favoritesState is FavoritesLoaded
                      ? favoritesState.favoriteHotels
                      : [];

                  return ListView.builder(
                    itemCount: hotelState.hotels.length,
                    itemBuilder: (context, index) {
                      final hotel = hotelState.hotels[index];

                      final isFavorite = favoriteHotels
                          .any((favHotel) => favHotel.hotelId == hotel.hotelId);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HotelCardWidget(
                          key: ValueKey(hotel.hotelId),
                          hotelId: hotel.hotelId,
                          imageUrl: hotel.images.isNotEmpty
                              ? hotel.images[0].large
                              : '',
                          hotelName: hotel.name.isNotEmpty
                              ? hotel.name
                              : 'Unknown Hotel',
                          hotelLocation: hotel.destination.isNotEmpty
                              ? hotel.destination
                              : 'Unknown Location',
                          day: hotel.bestOffer.days,
                          night: hotel.bestOffer.nights,
                          roomType: hotel.bestOffer.room.roomType,
                          meal: hotel.bestOffer.room.roomType,
                          adults: hotel.bestOffer.room.adultCount,
                          children: hotel.bestOffer.room.childCount,
                          flightIncluded: hotel.bestOffer.flightIncluded
                              ? 'inkl. Flug'
                              : 'ohne Flug',
                          pricePerPerson:
                              hotel.bestOffer.simplePricePerPerson / 100,
                          totalPrice: hotel.bestOffer.originalTravelPrice / 100,
                          isFavorite: isFavorite,
                          onFavoriteToggle: () {
                            final favoritesBloc =
                                BlocProvider.of<FavoritesBloc>(context);

                            if (isFavorite) {
                              favoritesBloc.add(RemoveFavorite(hotel.hotelId));
                            } else {
                              favoritesBloc.add(AddFavorite(hotel));
                            }
                          },
                        ),
                      );
                    },
                  );
                },
              );
            } else if (hotelState is HotelError) {
              return Center(child: Text('Error: ${hotelState.message}'));
            }

            return Center(child: Text('No hotels found.'));
          },
        ),
      ),
    );
  }
}
