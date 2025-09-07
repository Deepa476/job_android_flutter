import 'package:flutter/material.dart';
import 'package:job/widgets/job_card.dart';
import 'package:job/widgets/empty_state.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final applications = [
      {
        "title": "Senior Product Designer",
        "date": "Oct 20, 2024",
        "status": "Applied",
        "logoColor": Colors.green[900]
      },
      {
        "title": "UX Researcher",
        "date": "Oct 18, 2024",
        "status": "Applied",
        "logoColor": Colors.green[700]
      },
      {
        "title": "Product Manager",
        "date": "Oct 15, 2024",
        "status": "Applied",
        "logoColor": Colors.green[800]
      },
      {
        "title": "Data Analyst",
        "date": "Oct 12, 2024",
        "status": "Applied",
        "logoColor": Colors.green[600]
      },
    ];

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Applications",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Applied"),
              Tab(text: "Under Review"),
              Tab(text: "Interview"),
              Tab(text: "Rejected"),
              Tab(text: "Hired"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Applied Tab
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: applications.length,
              itemBuilder: (context, index) {
                final app = applications[index];
                return JobCard(
                  title: app["title"].toString(),
                  company: 'Company',
                  location: app["date"].toString(),
                  salaryRange: app["status"].toString(),
                  saved: false,
                  onTap: () {},
                );
              },
            ),
            // Other Tabs (empty states for now)
            const Center(child: EmptyState(icon: Icons.hourglass_empty, title: 'Under review', message: 'You will see updates here as recruiters review your applications.')),
            const Center(child: EmptyState(icon: Icons.event_available_outlined, title: 'No interviews yet', message: 'Interview invitations will appear here.')),
            const Center(child: EmptyState(icon: Icons.block_outlined, title: 'No rejections', message: 'Fingers crossed! Nothing to show here.')),
            const Center(child: EmptyState(icon: Icons.celebration_outlined, title: 'No hires yet', message: 'We will celebrate here when you get hired.')),
          ],
        ),
        // Bottom navigation handled by HomeShell
      ),
    );
  }
}
