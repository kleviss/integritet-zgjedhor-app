import 'package:integriteti_zgjedhor_app/screens/course_screen.dart';
import 'package:integriteti_zgjedhor_app/screens/details_screen.dart';
import 'package:integriteti_zgjedhor_app/screens/fast_form_report_screen.dart';
import 'package:integriteti_zgjedhor_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:integriteti_zgjedhor_app/screens/more_screen.dart';
import 'package:integriteti_zgjedhor_app/screens/my_screen.dart';
import 'package:integriteti_zgjedhor_app/screens/my_search_screen.dart';
import 'package:integriteti_zgjedhor_app/screens/report_form_screen.dart';
import 'package:integriteti_zgjedhor_app/screens/root_screen.dart';
import 'package:integriteti_zgjedhor_app/screens/scaffold_with_bottom_nav.dart';
import 'package:integriteti_zgjedhor_app/screens/targat_screen.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// the one and only GoRouter instance
final goRouter = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithBottomNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/targat',
          builder: (context, state) => const MySearchScreen(),
        ),
        GoRoute(
          path: '/shkelesit',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: RootScreen(
                label: 'SHKELESIT', detailsPath: '/shkelesit/details'),
          ),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) =>
                  const DetailsScreen(label: '/shkelesit/:id'),
            ),
          ],
        ),
        GoRoute(
          path: '/bashkite',
          pageBuilder: (context, state) => const NoTransitionPage(
            child:
                RootScreen(label: 'BASHKITE', detailsPath: '/bashkite/details'),
          ),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) =>
                  const DetailsScreen(label: '/bashkite/:id'),
            ),
          ],
        ),
        GoRoute(
          path: '/more',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MoreScreen(),
          ),
        ),
        GoRoute(
          path: '/report',
          pageBuilder: (context, state) => NoTransitionPage(
            child: ReportFormScreen(),
          ),
        ),
        GoRoute(
          path: '/privacy-policy',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: RootScreen(
              label: 'PRIVACY POLICY',
              detailsPath: '/privacy-policy/details',
            ),
          ),
        ),
      ],
    ),
  ],
);
