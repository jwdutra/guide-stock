import 'package:flutter/material.dart';

import 'package:design_system/maisrenda_design_system.dart';

import 'di.dart' as di;
import 'routes.dart';

Future<void> main() async {
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
      title: '',
      theme: AppTheme.lightTheme,
      // theme: AppTheme.darkTheme,
    );
  }
}
