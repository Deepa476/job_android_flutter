import 'package:flutter/material.dart';

class SearchJobsScreen extends StatefulWidget {
  const SearchJobsScreen({super.key});

  @override
  State<SearchJobsScreen> createState() => _SearchJobsScreenState();
}

class _SearchJobsScreenState extends State<SearchJobsScreen> {
  final TextEditingController _queryController = TextEditingController();
  final List<Map<String, String>> _results = const [
    {"title": "Flutter Developer", "company": "Acme Corp", "location": "Remote"},
    {"title": "Backend Engineer", "company": "ByteWorks", "location": "Berlin"},
    {"title": "Product Designer", "company": "Northstar", "location": "London"},
  ];

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.tune),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _queryController,
                    decoration: const InputDecoration(
                      hintText: 'Role, company, keyword',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (v) => setState(() {}),
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton.tonal(
                  onPressed: () {},
                  child: const Icon(Icons.filter_list),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Results', style: Theme.of(context).textTheme.titleMedium),
                Text('${_results.length} jobs', style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final job = _results[index];
                final query = _queryController.text.toLowerCase();
                if (query.isNotEmpty &&
                    !(job['title']!.toLowerCase().contains(query) ||
                      job['company']!.toLowerCase().contains(query) ||
                      job['location']!.toLowerCase().contains(query))) {
                  return const SizedBox.shrink();
                }
                return Card(
                  child: ListTile(
                    title: Text(job['title']!),
                    subtitle: Text('${job['company']} • ${job['location']}'),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


