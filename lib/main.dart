import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dreemz/core/routes/app_routes.dart';
import 'package:flutter/services.dart';

import 'package:dreemz/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:dreemz/injection.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:dreemz/core/theme/app_theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return ResponsiveBreakpoints(
        breakpoints: const [
          Breakpoint(start: 0, end: 450, name: MOBILE),
          Breakpoint(start: 451, end: 960, name: TABLET),
          Breakpoint(start: 961, end: double.infinity, name: DESKTOP),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => locator<DashboardCubit>()),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            title: 'Dreemz',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRouter.dashboardScreen,
          ),
        ),
      );
    });
  }
}
