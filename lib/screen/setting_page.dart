import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool jobAlerts = true;
  bool applicationUpdates = false;
  bool interviewReminders = false;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Notifications section
            SectionHeader(title: 'Notifications'),
            SwitchListTile(
              title: Text('Job Alerts'),
              value: jobAlerts,
              onChanged: (bool value) {
                setState(() {
                  jobAlerts = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Application Updates'),
              value: applicationUpdates,
              onChanged: (bool value) {
                setState(() {
                  applicationUpdates = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Interview Reminders'),
              value: interviewReminders,
              onChanged: (bool value) {
                setState(() {
                  interviewReminders = value;
                });
              },
            ),

            // App Preferences section
            SectionHeader(title: 'App Preferences'),
            ListTile(
              title: Text('Language'),
              subtitle: Text('English'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('Currency'),
              subtitle: Text('USD'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: darkMode,
              onChanged: (bool value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),

            // Privacy & Legal section
            SectionHeader(title: 'Privacy & Legal'),
            ListTile(
              title: Text('Data Sharing'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('Account Settings'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
