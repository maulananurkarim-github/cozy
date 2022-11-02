import 'package:go_router/go_router.dart';

import '../data/models/space.dart';
import '../modules/home/views/home_view.dart';
import '../modules/on_boarding/views/on_boarding_view.dart';
import '../modules/space_detail/views/space_detail_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeView(),
      routes: [
        GoRoute(
          path: 'space-detail',
          name: 'spaceDetail',
          builder: (context, state) {
            Object? args = state.extra;

            if (args != null && args is Space) {
              return SpaceDetailView(args);
            } else {
              return SpaceDetailView(args as Space);
            }
          },
        ),
      ],
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnBoardingView(),
    ),
  ],
  initialLocation: '/',
  debugLogDiagnostics: true,
  routerNeglect: true,
);
