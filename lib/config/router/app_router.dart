import 'package:go_router/go_router.dart';
import 'package:teslo_shop/features/auth/auth.dart';

final appRouter = GoRouter(
  initialLocation: '/register',
  routes: [

    ///* Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    ///* Product Routes
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
  ///! TODO: Bloquear si no se está autenticado de alguna manera
);