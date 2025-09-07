export '../../screen/profile.dart';
export '../../screen/edit_profile.dart';


import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture and Name Section
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person, size: 36),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ethan Carter',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Software Engineer',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const Text(
                        'San Francisco, CA',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),

              // About Section
              const Text(
                'About',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              const Text(
                'Highly motivated software engineer with 5+ years of experience in developing and maintaining web applications. Proven ability to work effectively in team environments and deliver high-quality solutions.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),

              // Skills Section
              const Text(
                'Skills',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  const Chip(label: Text('Java')),
                  const Chip(label: Text('Python')),
                  const Chip(label: Text('JavaScript')),
                  const Chip(label: Text('React')),
                  const Chip(label: Text('SQL')),
                  const Chip(label: Text('Agile')),
                ],
              ),
              SizedBox(height: 24),

              // Education Section
              const Text(
                'Education',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.school),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Stanford University',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Bachelor of Science in Computer Science',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Text(
                        '2014 - 2018',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Experience Section
              const Text(
                'Experience',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.business),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tech Solutions Inc.',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Software Engineer',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Text(
                        '2018 - Present',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Resume Section
              const Text(
                'Resume',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Icon(Icons.description_outlined),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Ethan_Carter_Resume.pdf',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      FilledButton.tonal(
                        onPressed: () {},
                        child: const Text('Download'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
