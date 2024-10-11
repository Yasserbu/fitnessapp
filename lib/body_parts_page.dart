import 'package:flutter/material.dart';

class BodyPartsPage extends StatelessWidget {
  const BodyPartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Body Parts',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // Add a back arrow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the home page
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/image/background2.jpg', // Replace with your beautiful background image
            fit: BoxFit.cover,
          ),
          // Overlay with opacity
          Container(
            color: Colors.black.withOpacity(0.5), // Add a semi-transparent overlay
          ),
          // Main content
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildBodyPartTile(context, 'BACK', 'assets/image/back.jpg', 'The back consists of muscles like the latissimus dorsi, trapezius, and rhomboids.'),
              _buildBodyPartTile(context, 'CARDIO', 'assets/image/cardio.jpg', 'Cardio exercises increase the heart rate and improve heart and lung health.'),
              _buildBodyPartTile(context, 'CHEST', 'assets/image/chest.jpg', 'The chest includes muscles such as the pectoralis major and minor.'),
              _buildBodyPartTile(context, 'ARMS', 'assets/image/arm.jpg', 'The arms consist of the biceps, triceps, and forearms.'),
              _buildBodyPartTile(context, 'LEGS', 'assets/image/leg.jpg', 'The legs include the quadriceps, hamstrings, calves, and glutes.'),
              _buildBodyPartTile(context, 'NECK', 'assets/image/neck.jpg', 'The neck muscles include the sternocleidomastoid and the trapezius.'),
              _buildBodyPartTile(context, 'SHOULDERS', 'assets/image/shoulder.jpg', 'The shoulders are made up of the deltoids and rotator cuff muscles.'),
            ],
          ),
        ],
      ),
    );
  }

  // Method to build each body part tile as a button with transparent background and white outline
  Widget _buildBodyPartTile(BuildContext context, String bodyPart, String imagePath, String description) {
    return GestureDetector(
      onTap: () {
        // Navigate to the body part description page when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BodyPartDetailPage(bodyPart: bodyPart, description: description),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // Rounded corners
          border: Border.all(color: Colors.white, width: 2), // White border
          color: Colors.transparent, // Transparent background
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12), // Rounded image
            child: Image.asset(
              imagePath,
              width: 70, // Larger image width
              height: 70, // Larger image height
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            bodyPart,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white, // White text
            ),
          ),
        ),
      ),
    );
  }
}

// Body part detail page to show description
class BodyPartDetailPage extends StatelessWidget {
  final String bodyPart;
  final String description;

  const BodyPartDetailPage({super.key, required this.bodyPart, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          bodyPart,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bodyPart,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

