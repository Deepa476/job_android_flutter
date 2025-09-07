import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String salaryRange;
  final bool saved;
  final VoidCallback? onTap;
  final VoidCallback? onSaveToggle;

  const JobCard({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    this.salaryRange = '',
    this.saved = false,
    this.onTap,
    this.onSaveToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.work_outline),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text('$company • $location', style: const TextStyle(color: Colors.black54)),
                    if (salaryRange.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(salaryRange, style: const TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ],
                ),
              ),
              IconButton(
                onPressed: onSaveToggle,
                icon: Icon(saved ? Icons.bookmark : Icons.bookmark_border),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


