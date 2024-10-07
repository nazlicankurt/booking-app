import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';

class HotelCarousel extends StatelessWidget {
  final List<HotelEntity> hotels;

  const HotelCarousel({super.key, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true, 
        enlargeCenterPage: true,
      ),
      items: hotels.map((hotel) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10.0), 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), 
                    child: Image.network(
                      hotel.images.first.small, 
                      height: 250.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    hotel.name,
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    hotel.bestOffer.room.roomType,
                    style: const TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
