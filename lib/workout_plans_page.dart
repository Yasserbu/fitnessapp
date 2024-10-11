import 'package:flutter/material.dart';

class WorkoutPlansPage extends StatelessWidget {
  const WorkoutPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Plans'),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/image/background3.jpg', // Background image path
            fit: BoxFit.cover,
          ),
          // No overlay, letting the image show through
          // Workout plan list
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildWorkoutPlanTile(
                'Day 1: Chest and Triceps', 
                'Focus on building chest strength with exercises like bench presses, and tone your triceps with dips and extensions.'
              ),
              _buildWorkoutPlanTile(
                'Day 2: Back and Biceps', 
                'Work on pulling exercises like rows and pull-ups to strengthen your back and build bigger biceps with curls.'
              ),
              _buildWorkoutPlanTile(
                'Day 3: Legs and Shoulders', 
                'Strengthen your lower body with squats and lunges, and develop shoulder definition with presses and raises.'
              ),
              _buildWorkoutPlanTile(
                'Day 4: Cardio and Abs', 
                'Increase your heart rate with cardio workouts such as running or cycling, followed by core exercises for a strong midsection.'
              ),
              _buildWorkoutPlanTile(
                'Day 5: Rest', 
                'Take a break to allow your muscles to recover. Rest is crucial for muscle growth and overall performance.'
              ),
              _buildWorkoutPlanTile(
                'Day 6: Full Body Workout', 
                'Engage all major muscle groups with compound movements like deadlifts, push-ups, and burpees for a full-body challenge.'
              ),
              _buildWorkoutPlanTile(
                'Day 7: Stretching and Flexibility', 
                'End the week with stretches and mobility exercises to improve flexibility, reduce soreness, and promote recovery.'
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Method to build each workout plan tile with enhanced layout and styling
  Widget _buildWorkoutPlanTile(String planName, String planDescription) {
    return Card(
      color: const Color.fromARGB(0, 63, 102, 64), // Set card color to transparent
      elevation: 0, // No shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planName,
              style: const TextStyle(
                fontSize: 20, // Larger font for the workout title
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255), // Change text to white
              ),
            ),
            const SizedBox(height: 8), // Spacing between title and description
            Text(
              planDescription,
              style: const TextStyle(
                fontSize: 16, // Slightly smaller font for the description
                color: Color.fromARGB(179, 255, 255, 255), // Softer white for description
              ),
            ),
          ],
        ),
      ),
    );
  }
}
