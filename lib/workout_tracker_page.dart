import 'package:flutter/material.dart';

class WorkoutTrackerPage extends StatelessWidget {
  const WorkoutTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Tracker'),
      ),
      body: const Center(
        child: Text(
          'Log your workouts here!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
