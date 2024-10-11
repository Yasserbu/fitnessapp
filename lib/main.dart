import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'body_parts_page.dart';
import 'workout_plans_page.dart';
import 'register_page.dart';
import 'water_intake_page.dart';
import 'bmi_calculator_page.dart';
import 'workout_tracker_page.dart';
import 'onboarding_page.dart'; // Import the Onboarding Page
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GymApp());
}

class GymApp extends StatelessWidget {
  const GymApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18.0, color: Colors.black),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: '/onboarding', // Set initial route to OnboardingPage
      routes: {
        '/onboarding': (context) => const OnboardingPage(), // Onboarding Route
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),
        '/bodyParts': (context) => const BodyPartsPage(),
        '/workoutPlans': (context) => const WorkoutPlansPage(),
        '/register': (context) => const RegisterPage(),
        '/waterIntake': (context) => const WaterIntakePage(),
        '/bmiCalculator': (context) => const BMICalculatorPage(),
        '/workoutTracker': (context) => const WorkoutTrackerPage(),
      },
    );
  }
}
