import 'package:flutter/material.dart';
import '../models/disease.dart';

class PathologyDetailPage extends StatelessWidget {
  final Disease pathology;

  const PathologyDetailPage({
    super.key,
    required this.pathology,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),

      appBar: AppBar(
        title: Text(pathology.name),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/pathoinfo.png",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              pathology.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              "Test Category: ${pathology.category}",
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            _sectionTile("Overview", pathology.shortDescription),
            _sectionTile("Helps Detect", pathology.diagnosis),
            _sectionTile("How It Helps", pathology.treatment),
            _sectionTile("Recommended When", pathology.riskFactors),
            _sectionTile("Result Meaning", pathology.prevention),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _sectionTile(String title, dynamic content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 12),

          content is String
              ? Text(
            content.isNotEmpty ? content : "No data available",
            style: const TextStyle(fontSize: 15),
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (content as List<String>).map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "• ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
