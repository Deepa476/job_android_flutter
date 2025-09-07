import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.all(12),
              itemCount: applications.length,
              itemBuilder: (context, index) {
                final app = applications[index];
                return Card(
                  elevation: 0,
                  color: Colors.grey[100],
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
                        color: app["logoColor"] as Color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    title: Text(
                      app["title"].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text("Applied on ${app["date"]}"),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        app["status"].toString(),
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            // Other Tabs (empty states for now)
            const Center(child: Text("No applications under review")),
            const Center(child: Text("No interviews scheduled")),
            const Center(child: Text("No rejections")),
            const Center(child: Text("No hired records")),
          ],
        ),
        // Bottom navigation handled by HomeShell
      ),
    );
  }
}
