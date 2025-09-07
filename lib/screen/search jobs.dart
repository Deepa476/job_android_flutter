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
        title: const Text('Search Jobs'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _queryController,
              decoration: const InputDecoration(
                hintText: 'Search for role, company, or keyword',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (v) => setState(() {}),
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
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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


class SearchJobsScreen extends StatefulWidget {
  const SearchJobsScreen({super.key});

  @override
  _SearchJobsScreenState createState() => _SearchJobsScreenState();
}

class _SearchJobsScreenState extends State<SearchJobsScreen> {
  // Controllers for search bar and dropdown selections
  final TextEditingController _searchController = TextEditingController();
  String _locationValue = 'Location';
  String _salaryValue = 'Salary';
  String _jobRoleValue = 'Job Role';

  // Recent search items
  final List<String> _recentSearches = [
    'Product Designer',
    'UX Designer',
    'UI Designer',
    'Web Designer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Jobs'),
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
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for jobs...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Dropdown filters
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown('Location', _locationValue),
                _buildDropdown('Salary', _salaryValue),
                _buildDropdown('Job Role', _jobRoleValue),
              ],
            ),
            SizedBox(height: 20),
            // Recent Searches
            Text(
              'Recent Searches',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _recentSearches.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_recentSearches[index]),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle tap to search this term
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Apps'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // Dropdown widget for location, salary, and job role
  Widget _buildDropdown(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: 100,
      child: DropdownButton<String>(
        isExpanded: true,
        value: value,
        icon: Icon(Icons.arrow_drop_down),
        onChanged: (String? newValue) {
          setState(() {
            if (label == 'Location') {
              _locationValue = newValue!;
            } else if (label == 'Salary') {
              _salaryValue = newValue!;
            } else if (label == 'Job Role') {
              _jobRoleValue = newValue!;
            }
          });
        },
        items: <String>['Location', 'Salary', 'Job Role']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}