// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter_booking_app/core/presentation/widgets/bottom_nav_bar.dart'
    as _i1;
import 'package:flutter_booking_app/src/favorites/presentation/views/favorites_view.dart'
    as _i2;
import 'package:flutter_booking_app/src/homepage/presentation/views/home_page_view.dart'
    as _i3;
import 'package:flutter_booking_app/src/hotels/presentation/views/hotels_view.dart'
    as _i4;
import 'package:flutter_booking_app/src/profile/presentation/views/profile_detail_page.dart'
    as _i5;
import 'package:flutter_booking_app/src/profile/presentation/views/profile_view.dart'
    as _i6;

/// generated route for
/// [_i1.BottomNavPage]
class BottomNavPage extends _i7.PageRouteInfo<void> {
  const BottomNavPage({List<_i7.PageRouteInfo>? children})
      : super(
          BottomNavPage.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavPage';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.BottomNavPage();
    },
  );
}

/// generated route for
/// [_i2.FavoritesView]
class FavoritesRoute extends _i7.PageRouteInfo<void> {
  const FavoritesRoute({List<_i7.PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavoritesView();
    },
  );
}

/// generated route for
/// [_i3.HomePageView]
class HomePageRoute extends _i7.PageRouteInfo<void> {
  const HomePageRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePageView();
    },
  );
}

/// generated route for
/// [_i4.HotelsView]
class HotelsRoute extends _i7.PageRouteInfo<void> {
  const HotelsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HotelsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HotelsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.HotelsView();
    },
  );
}

/// generated route for
/// [_i5.ProfileDetailView]
class ProfileDetailRoute extends _i7.PageRouteInfo<void> {
  const ProfileDetailRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ProfileDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileDetailRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfileDetailView();
    },
  );
}

/// generated route for
/// [_i6.ProfileRoute]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileRoute();
    },
  );
}
