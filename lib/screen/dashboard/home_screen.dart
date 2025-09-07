import 'package:flutter/material.dart';
import 'package:job/widgets/job_card.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Welcome, Jane!'),
              Icon(Icons.notifications_outlined),
            ],
          ),
          bottom: AppBar(
            automaticallyImplyLeading: false,
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Search for jobs... ',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Recommended For You', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                const JobCard(
                  title: 'Software Engineer',
                  company: 'Tech Company',
                  location: 'New York, NY',
                  salaryRange: '120k - 150k',
                  saved: false,
                ),
                const SizedBox(height: 16),
                Text('Popular Categories', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3.2,
                  children: [
                    _buildCategoryChip(context, 'Tech', Icons.computer),
                    _buildCategoryChip(context, 'Construction', Icons.engineering),
                    _buildCategoryChip(context, 'Healthcare', Icons.health_and_safety),
                    _buildCategoryChip(context, 'Marketing', Icons.campaign),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(BuildContext context, String label, IconData icon) {
    return Material(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}