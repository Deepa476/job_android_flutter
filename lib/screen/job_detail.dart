import 'package:flutter/material.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
                const CircleAvatar(
                  child: Icon(Icons.work),
                  radius: 25,
                ),
                SizedBox(width: 10),
                // Job Title and Company Name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Senior Product Designer',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Tech Innovators Inc.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      'San Francisco, CA',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Job Description Section
            const Text(
              'Job Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            const Text(
              'Tech Innovators Inc. is seeking a Senior Product Designer to lead the design of innovative digital products. The ideal candidate will have a strong portfolio showcasing user-centered design principles and a track record of delivering impactful solutions.',
            ),
            SizedBox(height: 20),
            // Requirements Section
            const Text(
              'Requirements',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildRequirementItem('5+ years of product design experience'),
            _buildRequirementItem('Proficiency in design tools (e.g., Figma, Sketch)'),
            _buildRequirementItem('Strong understanding of user research methodologies'),
            SizedBox(height: 20),
            // Benefits Section
            const Text(
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
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Apply Now'),
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
        const Icon(Icons.check_circle, size: 20),
        const SizedBox(width: 10),
        Expanded(child: Text(requirement)),
      ],
    );
  }

  Widget _buildBenefitItem(String benefit) {
    return Row(
      children: [
        const Icon(Icons.check_circle, size: 20),
        const SizedBox(width: 10),
        Expanded(child: Text(benefit)),
      ],
    );
  }
}
