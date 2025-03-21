import 'package:flutter/material.dart';
import 'router.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'EcoTracker',
      theme: ThemeData(
        useMaterial3: true,
        // Custom color scheme
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50),
          brightness: Brightness.light,
          primary: const Color(0xFF4CAF50),
          secondary: const Color(0xFF2196F3),
          tertiary: const Color(0xFFFFA726),
        ).copyWith(
          primaryContainer: const Color(0xFFE8F5E9),
          secondaryContainer: const Color(0xFFE3F2FD),
        ),

        // Card theme
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        // Elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),

        // Input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2),
          ),
        ),

        // App bar theme
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xFF4CAF50),
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4CAF50),
          ),
        ),

        // Bottom navigation bar theme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 8,
          selectedItemColor: Color(0xFF4CAF50),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
        ),

        // Floating action button theme
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF4CAF50),
          foregroundColor: Colors.white,
          elevation: 4,
        ),

        // Text theme
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E7D32),
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E7D32),
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1B5E20),
          ),
          bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF424242)),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF616161)),
        ),

        // Drawer theme
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
          elevation: 2,
        ),
      ),
    );
  }
}
