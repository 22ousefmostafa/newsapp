
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String image;
  final String title;
  final String category;

  const DetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),

      appBar: AppBar(
        backgroundColor: const Color(0xff1877F2),
        title: const Text(
          'Details News',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),

              child: Image.network(
                image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              category,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffB0B3B8),
              ),
            ),

            const SizedBox(height: 4),

            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xffE4E6EB),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Read the full story and get the latest updates '
              'about this news.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}