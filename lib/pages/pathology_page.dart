import 'package:flutter/material.dart';
import '../models/pathology.dart';
import '../data/pathology_tests.dart';

class PathologyPage extends StatelessWidget {
  const PathologyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pathology Tests"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: pathologyTests.length,
        itemBuilder: (context, index) {
          final PathologyTest pathology = pathologyTests[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(pathology.name),
              subtitle: Text(pathology.category),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        PathologyDetailPage(pathology: pathology),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PathologyDetailPage extends StatelessWidget {
  final PathologyTest pathology;

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

            _sectionTile(
              "Overview",
              _textContent(pathology.shortDescription),
            ),

            _sectionTile(
              "Helps Detect",
              _bulletList(pathology.helpsDetect),
            ),

            _sectionTile(
              "How It Helps",
              _bulletList(pathology.howItHelps),
            ),

            _sectionTile(
              "Recommended When",
              _bulletList(pathology.recommendedWhen),
            ),

            _sectionTile(
              "Result Meaning",
              _bulletList(pathology.resultMeaning),
            ),

            _sectionTile(
              "Normal Range",
              _textContent(pathology.normalRange),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _sectionTile(String title, Widget content) {
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
          content,
        ],
      ),
    );
  }

  Widget _textContent(String text) {
    return Text(
      text.isNotEmpty ? text : "No data available",
      style: const TextStyle(fontSize: 15),
    );
  }

  Widget _bulletList(List<String> items) {
    if (items.isEmpty) {
      return const Text("No data available");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
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
    );
  }
}
