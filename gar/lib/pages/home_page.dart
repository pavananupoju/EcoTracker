import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/app_drawer.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: AppBottomNavBar(
        selectedIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0: // Home
              break;
            case 1: // Map
              context.go('/map');
              break;
            case 2: // Stats
              context.go('/stats');
              break;
            case 3: // Profile
              context.go('/profile');
              break;
          }
        },
      ),
    );
  }
}
