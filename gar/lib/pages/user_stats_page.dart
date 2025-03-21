import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/activity_item.dart';
import '../widgets/app_drawer.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/stat_card.dart';
import '../widgets/welcome_section.dart';

class UserStatsPage extends StatefulWidget {
  const UserStatsPage({super.key});

  @override
  State<UserStatsPage> createState() => _UserStatsPageState();
}

class _UserStatsPageState extends State<UserStatsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EcoTracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.secondaryContainer,
            ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const WelcomeSection(),
                      const SizedBox(height: 24),
                      _buildStatsSection(),
                      const SizedBox(height: 24),
                      _buildRecentActivitiesSection(),
                      // Add extra padding at the bottom for FAB
                      const SizedBox(height: 80),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(
        selectedIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0: // Home
              context.go('/home');
              break;
            case 1: // Map
              context.go('/map');
              break;
            case 2: // Stats
              break;
            case 3: // Profile
              context.go('/profile');
              break;
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add new collection
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildStatsSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Impact',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: constraints.maxWidth,
              child: const StatCard(
                icon: Icons.delete_outline,
                title: 'Total Garbage Collected',
                value: '150 kg',
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: constraints.maxWidth,
              child: const StatCard(
                icon: Icons.eco_outlined,
                title: 'Environmental Impact',
                value: '75 trees saved',
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: constraints.maxWidth,
              child: const StatCard(
                icon: Icons.stars_outlined,
                title: 'Credits Earned',
                value: '750 points',
                color: Colors.orange,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRecentActivitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          'Recent Activities',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        ActivityItem(
          date: 'Today',
          title: 'Plastic Collection',
          amount: '2.5 kg',
          icon: Icons.recycling,
        ),
        ActivityItem(
          date: 'Yesterday',
          title: 'Paper Collection',
          amount: '3.0 kg',
          icon: Icons.description_outlined,
        ),
      ],
    );
  }
}
