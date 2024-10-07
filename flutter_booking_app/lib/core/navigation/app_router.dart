import 'package:auto_route/auto_route.dart';
import 'package:flutter_booking_app/core/navigation/app_router.gr.dart';
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BottomNavPage.page,
          path: '/',
          initial: true,
          children: [
            AutoRoute(page: HomePageRoute.page, path: 'home',),
            AutoRoute(page: HotelsRoute.page, path: 'hotels'),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
         
            ),
            AutoRoute(page: FavoritesRoute.page, path: 'favorites'),
          ],
        ),
      ];
}
