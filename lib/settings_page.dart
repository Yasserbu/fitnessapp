import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Dark Mode Toggle
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                });
                // Add functionality to switch themes if needed
              },
            ),
          ),
          const Divider(),
          // Notification Toggle
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Enable Notifications'),
            trailing: Switch(
              value: isNotificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  isNotificationEnabled = value;
                });
                // Add notification handling code if necessary
              },
            ),
          ),
          const Divider(),
          // Account Section
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Manage Account'),
            onTap: () {
              // Navigate to Account Management page if implemented
            },
          ),
          const Divider(),
          // About Section
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              // Navigate to About page if implemented
            },
          ),
        ],
      ),
    );
  }
}
