import 'package:flutter/material.dart';
import 'package:job/router/app_router.dart';

class HomeDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Welcome, Jane!'),
            Icon(Icons.notifications),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for jobs...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Recommended For You',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 5,
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text('Software Engineer'),
                subtitle: Text('Tech Company, New York, NY'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('\$120k - \$150k'),
                    Text('Full-time', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Popular Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildCategoryItem('Tech', Icons.computer),
                _buildCategoryItem('Construction', Icons.build),
                _buildCategoryItem('Healthcare', Icons.health_and_safety),
                _buildCategoryItem('Marketing', Icons.volume_up),
              ],
            ),
          ],
        ),
      ),
      // Bottom navigation is provided by HomeShell
    );
  }

  Widget _buildCategoryItem(String category, IconData icon) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.blue),
          SizedBox(height: 10),
          Text(category),
        ],
      ),
    );
  }
}