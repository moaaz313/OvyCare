import 'package:flutter/material.dart';

class FoodTipsView extends StatelessWidget {
  final List<Map<String, String>> tips = [
    {
      'image': 'assets/images/tip1.jpg',
      'title': 'Focus on Low GI Foods',
      'subtitle': 'Choose whole grains, legumes, and veggies to help regulate blood sugar levels.',
      'buttonText': 'Learn More'
    },
    {
      'image': 'assets/images/tip2.jpg',
      'title': 'Add Omega-3 Fatty Acids',
      'subtitle': 'Include fish, chia seeds, and walnuts to reduce inflammation and improve hormone balance.',
      'buttonText': 'Discover Recipes'
    },
    {
      'image': 'assets/images/tip3.jpg',
      'title': 'Increase Fiber Intake',
      'subtitle': 'Opt for oats, quinoa, broccoli, and berries to reduce insulin resistance.',
      'buttonText': 'Read More'
    },
    {
      'image': 'assets/images/tip4.jpg',
      'title': 'Stay Hydrated',
      'subtitle': 'Drink plenty of water and herbal teas to support hormone balance and overall health.',
      'buttonText': 'Get Tips'
    },
    {
      'image': 'assets/images/tip5.jpg',
      'title': 'Snack Smartly',
      'subtitle': 'Choose healthy snacks like nuts, veggies with hummus, or fruit with nut butter.',
      'buttonText': 'Healthy Snacks'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Healthy Food Tips'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tips.length,
          itemBuilder: (context, index) {
            final tip = tips[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      tip['image']!,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tip['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          tip['subtitle']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle button action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(tip['buttonText']!),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

