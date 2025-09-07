import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture and Name Section
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile_picture.jpg'), // replace with your image path
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ethan Carter',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Software Engineer',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      'San Francisco, CA',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),

            // About Section
            Text(
              'About',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Highly motivated software engineer with 5+ years of experience in developing and maintaining web applications. Proven ability to work effectively in team environments and deliver high-quality solutions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),

            // Skills Section
            Text(
              'Skills',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('Java')),
                Chip(label: Text('Python')),
                Chip(label: Text('JavaScript')),
                Chip(label: Text('React')),
                Chip(label: Text('SQL')),
                Chip(label: Text('Agile')),
              ],
            ),
            SizedBox(height: 24),

            // Education Section
            Text(
              'Education',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Image.asset(
                  'assets/stanford_logo.png', // Replace with your Stanford logo
                  height: 30,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stanford University',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bachelor of Science in Computer Science',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '2014 - 2018',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),

            // Experience Section
            Text(
              'Experience',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Image.asset(
                  'assets/tech_solutions_logo.png', // Replace with your company's logo
                  height: 30,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tech Solutions Inc.',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Software Engineer',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '2018 - Present',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),

            // Resume Section
            Text(
              'Resume',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.file_copy),
                SizedBox(width: 8),
                Text(
                  'Ethan_Carter_Resume.pdf',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.download),
                  onPressed: () {
                    // Add download functionality here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
