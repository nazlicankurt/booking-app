import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileDetailView extends StatelessWidget {
  const ProfileDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Detail'),
      ),
      body: const Center(
        child: Text('This is the Profile Detail Page'),
      ),
    );
  }
}
