import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/map_page.dart';
import 'pages/statspage.dart';
import 'pages/profile_page.dart';
import 'pages/user_stats_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/user-stats',
      builder: (context, state) => const UserStatsPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const UserStatsPage(),
    ),
    GoRoute(
      path: '/map',
      builder: (context, state) => const MapPage(),
    ),
    GoRoute(
      path: '/stats',
      builder: (context, state) => const StatsPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
  ],
);
