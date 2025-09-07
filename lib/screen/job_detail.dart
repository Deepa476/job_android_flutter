import 'package:flutter/material.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Title, Company, and Location
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company logo
                CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'), // Replace with your logo asset
                  radius: 25,
                ),
                SizedBox(width: 10),
                // Job Title and Company Name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Senior Product Designer',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Tech Innovators Inc.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'San Francisco, CA',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Job Description Section
            Text(
              'Job Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Tech Innovators Inc. is seeking a Senior Product Designer to lead the design of innovative digital products. The ideal candidate will have a strong portfolio showcasing user-centered design principles and a track record of delivering impactful solutions.',
            ),
            SizedBox(height: 20),
            // Requirements Section
            Text(
              'Requirements',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildRequirementItem('5+ years of product design experience'),
            _buildRequirementItem('Proficiency in design tools (e.g., Figma, Sketch)'),
            _buildRequirementItem('Strong understanding of user research methodologies'),
            SizedBox(height: 20),
            // Benefits Section
            Text(
              'Benefits',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildBenefitItem('Competitive salary and equity'),
            _buildBenefitItem('Comprehensive health benefits'),
            _buildBenefitItem('Flexible work hours'),
            SizedBox(height: 20),
            // Apply Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your apply functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Apply Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequirementItem(String requirement) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: Colors.blue, size: 20),
        SizedBox(width: 10),
        Expanded(child: Text(requirement)),
      ],
    );
  }

  Widget _buildBenefitItem(String benefit) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: Colors.blue, size: 20),
        SizedBox(width: 10),
        Expanded(child: Text(benefit)),
      ],
    );
  }
}
