import 'package:go_router/go_router.dart';
import 'package:teslo_shop/features/auth/auth.dart';

final appRouter = GoRouter(
  routes: [

    ///* Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    ///* Product Routes
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
  ///! TODO: Bloquear si no se está autenticado de alguna manera
);