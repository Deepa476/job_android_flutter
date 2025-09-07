import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  String fullName = '';
  String email = '';
  String phoneNumber = '';
  String location = '';
  String institution = '';
  String major = '';
  String graduationYear = '';
  String jobTitle = '';
  String company = '';
  String employmentPeriod = '';
  String responsibilities = '';
  String skills = '';
  String aboutMe = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Profile Picture
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_picture.jpg'), // Replace with actual path
                  ),
                  SizedBox(width: 16),
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
                      // Add image picker functionality here
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Personal Information
              Text(
                'Personal Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              _buildTextField('Full Name', 'Enter full name', (value) => fullName = value),
              _buildTextField('Email', 'Enter email', (value) => email = value),
              _buildTextField('Phone Number', 'Enter phone number', (value) => phoneNumber = value),
              _buildTextField('Location', 'Enter location', (value) => location = value),

              // Education Section
              SizedBox(height: 24),
              Text(
                'Education',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              _buildTextField('Institution', 'Enter institution', (value) => institution = value),
              _buildTextField('Major', 'Enter major', (value) => major = value),
              _buildTextField('Graduation Year', 'Enter graduation year', (value) => graduationYear = value),

              // Experience Section
              SizedBox(height: 24),
              Text(
                'Experience',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              _buildTextField('Job Title', 'Enter job title', (value) => jobTitle = value),
              _buildTextField('Company', 'Enter company name', (value) => company = value),
              _buildTextField('Employment Period', 'Enter employment period', (value) => employmentPeriod = value),
              _buildTextField('Responsibilities', 'Enter responsibilities', (value) => responsibilities = value),

              // Other Details Section
              SizedBox(height: 24),
              Text(
                'Other Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              _buildTextField('Skills', 'Enter skills', (value) => skills = value),
              _buildTextField('About Me', 'Tell us a little about yourself', (value) => aboutMe = value),

              // Save Changes Button
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveChanges,
                child: Text('Save Changes'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TextField builder for form fields
  Widget _buildTextField(String label, String hintText, Function(String) onSaved) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        onSaved: (value) {
          onSaved(value ?? '');
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  // Function to save the profile changes
  void _saveChanges() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Process the saved data (e.g., send to a server, store locally, etc.)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated!')));
    }
  }
}
