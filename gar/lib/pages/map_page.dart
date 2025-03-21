import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/app_drawer.dart';
import 'package:go_router/go_router.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Map Page'),
      ),
      bottomNavigationBar: AppBottomNavBar(
        selectedIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0: // Home
              context.go('/user-stats');
              break;
            case 1: // Map
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
