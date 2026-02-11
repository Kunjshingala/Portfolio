import 'package:go_router/go_router.dart';
import '../../presentation/screens/portfolio_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const PortfolioScreen()),
    ],
  );
}
