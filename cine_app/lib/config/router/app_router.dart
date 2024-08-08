import 'package:go_router/go_router.dart';
import 'package:cine_app/presentation/screens.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    

  ]
);