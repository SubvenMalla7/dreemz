import 'package:flutter/material.dart';
import 'package:dreemz/features/dashboard/presentation/screen/dashboard_screen.dart';

class AppRouter {
  const AppRouter._();

  static const String splashScreen = '/splashScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String bookDetailScreen = '/bookDetailScreen';
  static const String imageCaptureScreen = '/imageCaptureScreen';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Object? argument = settings.arguments;
    print(argument);
    switch (settings.name) {
      case dashboardScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const DashboardScreen(),
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const DashboardScreen(),
          settings: settings,
        );
    }
  }
}
