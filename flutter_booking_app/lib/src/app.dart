import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_booking_app/core/navigation/app_router.dart';
import 'package:flutter_booking_app/core/services/service_locator.dart';
import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:flutter_booking_app/src/homepage/presentation/bloc/hotel_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings/settings_controller.dart';

class MyApp extends StatelessWidget {
 const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

   return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HotelBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<FavoritesBloc>(),
        ),
      ],
      child: ListenableBuilder(
        listenable: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: appRouter.delegate(),
            restorationScopeId: 'app',
            locale: settingsController.locale, 
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            
            supportedLocales: const [
              Locale('en', ''),
              Locale('de', ''),
              Locale('tr', ''),
            ],
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.offers,
            theme: ThemeData(
              useMaterial3: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.openSansTextTheme(), 
            ),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,
            
          );
        },
      ),
    );
  }
}
