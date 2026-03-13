import 'package:flutter/material.dart';
import '../models/disease.dart';

class DiseaseDetailPage extends StatelessWidget {
  final Disease disease;

  const DiseaseDetailPage({
    super.key,
    required this.disease,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),

      appBar: AppBar(
        title: Text(disease.name),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// IMAGE (static as you kept)
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

            /// TITLE
            Text(
              disease.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              "Pathology: ${disease.category}",
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            _sectionTile("Overview", _textContent(disease.shortDescription)),
            _sectionTile("Symptoms", _bulletList(disease.symptoms)),
            _sectionTile("Causes", _bulletList(disease.causes)),
            _sectionTile("Diagnosis", _bulletList(disease.diagnosis)),
            _sectionTile("Treatment", _bulletList(disease.treatment)),
            _sectionTile("Prevention", _bulletList(disease.prevention)),
            _sectionTile("Risk Factors", _bulletList(disease.riskFactors)),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// Section Tile
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

  /// Normal Text Content (Safe)
  Widget _textContent(String text) {
    return Text(
      text.isNotEmpty ? text : "No data available",
      style: const TextStyle(fontSize: 15),
    );
  }

  /// Bullet List Builder (Safe Version)
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
