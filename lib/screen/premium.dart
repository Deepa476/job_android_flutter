import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PremiumPlansScreen(),
    );
  }
}

class PremiumPlansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Premium Plans'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Premium Plan Header
            Text(
              'Unlock Premium Features',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Basic Plan
            PlanCard(
              planTitle: 'Basic',
              price: 'Free/month',
              features: [
                'Access to all job listings',
                'Basic profile features',
              ],
              isCurrentPlan: true,
            ),
            SizedBox(height: 16),

            // Premium Plan
            PlanCard(
              planTitle: 'Premium',
              price: '\$19.99/month',
              features: [
                'Unlimited job applications',
                'Advanced profile customization',
                'Priority application review',
                'Exclusive job alerts',
              ],
              isCurrentPlan: false,
              isPopular: true,
            ),
            SizedBox(height: 16),

            // Payment Method Section
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Credit Card'),
              subtitle: Text('Visa ending in 4242'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(height: 32),

            // Confirm Payment Button
            ElevatedButton(
              onPressed: () {},
              child: Text('Confirm Payment'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String planTitle;
  final String price;
  final List<String> features;
  final bool isCurrentPlan;
  final bool isPopular;

  const PlanCard({
    required this.planTitle,
    required this.price,
    required this.features,
    this.isCurrentPlan = false,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isPopular ? Colors.blue : Colors.grey,
          width: 2,
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plan Title and Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                planTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isCurrentPlan ? Colors.grey : Colors.black,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isCurrentPlan ? Colors.grey : Colors.black,
                ),
              ),
            ],
          ),
          if (isPopular)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                color: Colors.blue,
                child: Text(
                  'MOST POPULAR',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          SizedBox(height: 8),

          // Plan Features
          Column(
            children: features
                .map((feature) => Row(
              children: [
                Icon(Icons.check, size: 18, color: Colors.blue),
                SizedBox(width: 8),
                Expanded(child: Text(feature)),
              ],
            ))
                .toList(),
          ),
          if (!isCurrentPlan)
            SizedBox(height: 16),
          if (!isCurrentPlan)
            ElevatedButton(
              onPressed: () {},
              child: Text('Upgrade'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
        ],
      ),
    );
  }
}
