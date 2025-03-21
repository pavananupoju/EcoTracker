import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/app_drawer.dart';
import 'package:go_router/go_router.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards & Coupons'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Show filter options
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Available Coupons',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Redeem your eco-points for exclusive discounts',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      ),
                ),
                const SizedBox(height: 24),
                _buildCouponCard(
                  context,
                  'Swiggy',
                  'ECOEAT50',
                  '50% OFF up to ₹150',
                  'Valid on orders above ₹299',
                  'assets/swiggy_logo.png',
                  Colors.orange,
                  '2000 points',
                  DateTime(2025, 4, 30),
                ),
                const SizedBox(height: 16),
                _buildCouponCard(
                  context,
                  'Zomato',
                  'ECOFOOD40',
                  '40% OFF up to ₹200',
                  'Valid on all restaurants',
                  'assets/zomato_logo.png',
                  Colors.red,
                  '1800 points',
                  DateTime(2025, 4, 25),
                ),
                const SizedBox(height: 16),
                _buildCouponCard(
                  context,
                  'Myntra',
                  'ECOSTYLE30',
                  '30% OFF up to ₹1000',
                  'Valid on selected fashion items',
                  'assets/myntra_logo.png',
                  Colors.pink,
                  '2500 points',
                  DateTime(2025, 4, 15),
                ),
                const SizedBox(height: 16),
                _buildCouponCard(
                  context,
                  'Amazon',
                  'ECOAMAZON25',
                  '25% OFF up to ₹500',
                  'Valid on eco-friendly products',
                  'assets/amazon_logo.png',
                  Colors.blue,
                  '1500 points',
                  DateTime(2025, 4, 20),
                ),
                const SizedBox(height: 16),
                _buildCouponCard(
                  context,
                  'Flipkart',
                  'ECOSAVE35',
                  '35% OFF up to ₹750',
                  'Valid on all products',
                  'assets/flipkart_logo.png',
                  Colors.indigo,
                  '2200 points',
                  DateTime(2025, 4, 28),
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
              context.go('/user-stats');
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
    );
  }

  Widget _buildCouponCard(
    BuildContext context,
    String brand,
    String code,
    String discount,
    String description,
    String logoPath,
    Color brandColor,
    String points,
    DateTime validity,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              brandColor.withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: brandColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(Icons.shopping_bag, color: brandColor),
                    // In a real app, use Image.asset(logoPath)
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          brand,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: brandColor,
                              ),
                        ),
                        Text(
                          'Valid till ${validity.day}/${validity.month}/${validity.year}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: brandColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      points,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discount,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.copy, size: 16),
                              const SizedBox(width: 8),
                              Text(
                                code,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          // Handle redeem action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: brandColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Redeem'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
