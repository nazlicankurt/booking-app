import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app/core/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: CustomAppBar(title: 'Profiles'),
      body: const Center(
        child: Text('This is the Profile Page'),
      ),
    );
  }
}
