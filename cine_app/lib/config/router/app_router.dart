import 'package:go_router/go_router.dart';
import 'package:cine_app/presentation/home_screen.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    

  ]
);