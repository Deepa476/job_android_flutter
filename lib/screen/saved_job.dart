import 'package:flutter/material.dart';

class SavedJobsScreen extends StatelessWidget {
  const SavedJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobs = [
      {
        "title": "Software Engineer",
        "company": "Tech Solutions Inc.",
        "location": "San Francisco, CA",
        "logoColor": Colors.green[900]
      },
      {
        "title": "Data Analyst",
        "company": "Global Innovations Ltd.",
        "location": "New York, NY",
        "logoColor": Colors.green[700]
      },
      {
        "title": "UX/UI Designer",
        "company": "Creative Minds Agency",
        "location": "Remote",
        "logoColor": Colors.green[800]
      },
      {
        "title": "AI Specialist",
        "company": "Future Systems Corp.",
        "location": "Austin, TX",
        "logoColor": Colors.amber[100]
      },
      {
        "title": "Web Developer",
        "company": "Digital Edge Solutions",
        "location": "London, UK",
        "logoColor": Colors.green[800]
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Saved Jobs",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return Card(
            elevation: 1,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: job["logoColor"] as Color,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              title: Text(
                job["title"].toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(job["company"].toString()),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        job["location"].toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: const Icon(Icons.bookmark_border),
            ),
          );
        },
      ),
      // Bottom navigation handled by HomeShell
    );
  }
}
