import 'package:flutter/material.dart';

class InterviewPrepScreen extends StatelessWidget {
  const InterviewPrepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tips = [
      {
        "icon": Icons.search,
        "title": "Research the Company",
        "subtitle": "Understand the company's mission, values, and recent news."
      },
      {
        "icon": Icons.mic,
        "title": "Practice Your Answers",
        "subtitle": "Practice answering common interview questions out loud."
      },
      {
        "icon": Icons.person,
        "title": "Dress Appropriately",
        "subtitle": "Dress professionally and look your best."
      },
      {
        "icon": Icons.help_outline,
        "title": "Prepare Questions to Ask",
        "subtitle": "Ask thoughtful questions about the role and company culture."
      },
    ];

    final sampleQuestions = [
      "Tell me about yourself.",
      "What are your strengths and weaknesses?",
      "Why are you interested in this role?",
      "Where do you see yourself in 5 years?",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Interview Prep"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "Tips for a Successful Interview",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Tips List
            ...tips.map((tip) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade50,
                    child: Icon(tip["icon"] as IconData, color: Colors.blue),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tip["title"] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          tip["subtitle"] as String,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),

            const SizedBox(height: 12),

            const Text(
              "Sample Interview Questions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Questions List
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: sampleQuestions.map((q) {
                  return ListTile(
                    title: Text(q),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Practice Tools",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Practice Tools
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color(0xFFEAF2FF),
                          child: Icon(Icons.video_call, color: Colors.blue),
                        ),
                        SizedBox(height: 8),
                        Text("Mock Interview"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color(0xFFEAF2FF),
                          child: Icon(Icons.timer, color: Colors.blue),
                        ),
                        SizedBox(height: 8),
                        Text("Answer Timer"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Prep tab selected
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: "Prep"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
