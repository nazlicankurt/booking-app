import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_booking_app/core/navigation/app_router.gr.dart';
import 'package:flutter_booking_app/core/presentation/bloc/bottom_nav_bar_bloc.dart';
import 'package:flutter_booking_app/core/presentation/bloc/bottom_nav_bar_event.dart';
import 'package:flutter_booking_app/core/presentation/bloc/bottom_nav_bar_state.dart';

@RoutePage()
class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavBarBloc(),
      child: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: (context, state) {
          return AutoTabsRouter(
            routes: [
              HomePageRoute(),
              HotelsRoute(),
              FavoritesRoute(),
              ProfileRoute(),
            ],
            builder: (context, child) {
              final tabsRouter = AutoTabsRouter.of(context);

              return Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: NavigationBar(
                  selectedIndex: state.selectedIndex,
                  onDestinationSelected: (index) {
                    context.read<BottomNavBarBloc>().add(SelectTab(index));
                    tabsRouter.setActiveIndex(index);
                  },
                  destinations: const [
                    NavigationDestination(
                      icon: FaIcon(FontAwesomeIcons.house),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                      label: 'Hotels',
                    ),
                    NavigationDestination(
                      icon: FaIcon(FontAwesomeIcons.heart),
                      label: 'Favorites',
                    ),
                    NavigationDestination(
                      icon: FaIcon(FontAwesomeIcons.user),
                      label: 'Profile',
                    ),
                  ],
                  backgroundColor: Colors.white.withOpacity(0.7),
                  elevation: 0, 
                ),
                body: child,
              );
            },
          );
        },
      ),
    );
  }
}
