import 'package:flutter/material.dart';
import 'package:job/widgets/job_card.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return JobCard(
            title: job["title"].toString(),
            company: job["company"].toString(),
            location: job["location"].toString(),
            saved: true,
            onTap: () {},
          );
        },
      ),
      // Bottom navigation handled by HomeShell
    );
  }
}
