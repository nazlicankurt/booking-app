import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class ProfileRoute extends StatelessWidget {

  const ProfileRoute({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile Page'),
            DropdownButton<Locale>(
         
              onChanged: (Locale? locale) {
              },
              items: const [
                DropdownMenuItem(
                  value: Locale('en', ''),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('de', ''),
                  child: Text('Deutsch'),
                ),
                DropdownMenuItem(
                  value: Locale('tr', ''),
                  child: Text('Türkçe'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
