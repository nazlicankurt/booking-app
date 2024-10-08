import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_booking_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_booking_app/core/navigation/app_router.gr.dart';
import 'package:flutter_booking_app/src/settings/settings_controller.dart';
import 'package:flutter_booking_app/src/settings/settings_service.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Achievements',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            AchievementCard(
              icon: FontAwesomeIcons.globe,
              title: '10 Countries Visited',
              description: '🌍 World traveler!',
              color: Colors.blue,
            ),
            AchievementCard(
              icon: FontAwesomeIcons.hotel,
              title: '20 Hotels Stayed',
              description: '🏨 Hotel expert! 20 stays!',
              color: Colors.green,
            ),
            AchievementCard(
              icon: FontAwesomeIcons.passport,
              title: '5 International Trips',
              description: '✈️ Jet-setter! 5 trips!',
              color: Colors.orange,
            ),
            AchievementCard(
              icon: FontAwesomeIcons.plane,
              title: '100 Flights Taken',
              description: '🛫 100 flights logged!',
              color: Colors.purple,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.router.push(
                  SettingsRoute(
                      controller: SettingsController(SettingsService())),
                );
              },
              child: const Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const AchievementCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            FaIcon(
              icon,
              size: 40,
              color: color,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
