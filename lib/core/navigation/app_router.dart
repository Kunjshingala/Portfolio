import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kunj_shingala/presentation/screens/all_projects_screen.dart';
import 'package:kunj_shingala/presentation/screens/resume_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ResumeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/projects',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AllProjectsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeOutCubic)),
              ),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
      ),
    ],
  );
}
