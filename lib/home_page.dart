import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late List<YoutubePlayerController> _controllers;

  final List<String> videoIds = [
    'cbKkB3POqaY',
    'ow3hpYJqYEI',
    'ie7nbEybL6k',
    'FBs0l6cxl1o',
    'WaW-u4QnwX8',
  ];

  @override
  void initState() {
    super.initState();
    _controllers = videoIds.map((id) {
      return YoutubePlayerController(
        initialVideoId: id,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          enableCaption: true,
          isLive: false,
          loop: false,
          forceHD: true,
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/bodyParts');
        break;
      case 1:
        Navigator.pushNamed(context, '/workoutPlans');
        break;
      case 2:
        Navigator.pushNamed(context, '/profile');
        break;
      case 3:
        Navigator.pushNamed(context, '/settings');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Name Gym',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Body Parts'),
              onTap: () {
                Navigator.pushNamed(context, '/bodyParts');
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Workout Plans'),
              onTap: () {
                Navigator.pushNamed(context, '/workoutPlans');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/image/background6.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      },
                    ),
                    const Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: _controllers.map((controller) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: YoutubePlayer(
                            controller: controller,
                            showVideoProgressIndicator: true,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    _buildFeatureButton(
                      'Water Intake',
                      Icons.local_drink,
                      Colors.blueAccent,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureButton(
                      'BMI Calculator',
                      Icons.monitor_weight,
                      Colors.greenAccent,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureButton(
                      'Workout Tracker',
                      Icons.fitness_center,
                      Colors.orangeAccent,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureButton(
                      'Nutrition Tips',
                      Icons.restaurant,
                      Colors.redAccent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black.withOpacity(0.5),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Body Parts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Workout Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButton(String feature, IconData icon, Color iconColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: OutlinedButton.icon(
        onPressed: () => _navigateToFeature(feature),
        icon: Icon(icon, color: iconColor, size: 36),
        label: Text(
          feature,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
          backgroundColor: Colors.grey[800],
          side: BorderSide(color: iconColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  void _navigateToFeature(String feature) {
    switch (feature) {
      case 'Water Intake':
        Navigator.pushNamed(context, '/waterIntake');
        break;
      case 'BMI Calculator':
        Navigator.pushNamed(context, '/bmiCalculator');
        break;
      case 'Workout Tracker':
        Navigator.pushNamed(context, '/workoutTracker');
        break;
      case 'Nutrition Tips':
        Navigator.pushNamed(context, '/nutritionTips');
        break;
      default:
        break;
    }
  }
}
