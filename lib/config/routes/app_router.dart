import 'package:go_router/go_router.dart';
import 'package:weather_app/presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);