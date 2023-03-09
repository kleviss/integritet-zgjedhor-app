import 'package:integriteti_zgjedhor_app/screens/course_screen.dart';
import 'package:integriteti_zgjedhor_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage<void>(child: HomeScreen());
      },
      routes: [
        GoRoute(
          path: 'course/:id',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage<void>(
              child: CourseScreen(
                id: state.params['id']!,
              ),
            );
          },
        ),
      ],
    ),
  ],
);
