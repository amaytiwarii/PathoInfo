import 'package:flutter/material.dart';
import '../data/disease_data.dart';
import '../details/disease_details_page.dart';

class DiseasesPage extends StatefulWidget {
  const DiseasesPage({Key? key}) : super(key: key);

  @override
  State<DiseasesPage> createState() => _DiseasesPageState();
}

class _DiseasesPageState extends State<DiseasesPage> {

  List<Map<String, String>> diseases = [
    {
      "title": "Type 2 Diabetes",
      "category": "Hormonal",
      "status": "COMMON",
      "image": "assets/diabetes.jpg",
    },
    {
      "title": "Anemia",
      "category": "Blood",
      "status": "COMMON",
      "image": "assets/anemia.png",
    },
    {
      "title": "Influenza (Flu)",
      "category": "Infectious",
      "status": "RARE (REGIONAL)",
      "image": "assets/diabetes.jpg",
    },
    {
      "title": "Hypertension",
      "category": "Cardiovascular",
      "status": "COMMON",
      "image": "assets/diabetes.jpg",
    },
  ];

  List<Map<String, String>> filteredDiseases = [];

  @override
  void initState() {
    super.initState();
    filteredDiseases = diseases;
  }

  void searchDisease(String query) {
    final results = diseases.where((disease) {
      final title = disease["title"]!.toLowerCase();
      final category = disease["category"]!.toLowerCase();
      final status = disease["status"]!.toLowerCase();
      final input = query.toLowerCase();

      return title.contains(input) ||
          category.contains(input) ||
          status.contains(input);
    }).toList();

    setState(() {
      filteredDiseases = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Diseases"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            /// SEARCH BAR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onChanged: searchDisease,
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search diseases, category, status...",
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// DISEASE LIST
            Expanded(
              child: filteredDiseases.isEmpty
                  ? const Center(
                child: Text("No diseases found"),
              )
                  : ListView.builder(
                itemCount: filteredDiseases.length,
                itemBuilder: (context, index) {
                  final disease = filteredDiseases[index];

                  return DiseaseCard(
                    title: disease["title"]!,
                    category: disease["category"]!,
                    status: disease["status"]!,
                    image: disease["image"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiseaseCard extends StatelessWidget {
  final String title;
  final String category;
  final String status;
  final String image;

  const DiseaseCard({
    Key? key,
    required this.title,
    required this.category,
    required this.status,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final disease = pathologies.firstWhere(
          (d) => d.name.toLowerCase() == title.toLowerCase(),
      orElse: () => pathologies.first,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: TextStyle(
                    color: status.contains("RARE")
                        ? Colors.orange
                        : Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DiseaseDetailPage(disease: disease),
                      ),
                    );
                  },
                  child: const Text("View Details >"),
                )
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}