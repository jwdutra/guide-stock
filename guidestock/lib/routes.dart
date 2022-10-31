import 'package:go_router/go_router.dart';

import 'presenter/chart/chart_page.dart';
import 'presenter/home/home_page.dart';
import 'presenter/table/table_page.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/table',
        builder: (context, state) {
          return TablePage(quotes: state.extra);
        },
      ),
      GoRoute(
        path: '/graph',
        builder: (context, state) {
          return ChartPage(graphs: state.extra);
        },
      ),
    ],
  );
}
