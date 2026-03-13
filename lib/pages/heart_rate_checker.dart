import 'package:flutter/material.dart';

class HeartRateChecker extends StatefulWidget {
  const HeartRateChecker({super.key});

  @override
  State<HeartRateChecker> createState() => _HeartRateCheckerState();
}

class _HeartRateCheckerState extends State<HeartRateChecker> {

  final TextEditingController ageController = TextEditingController();
  final TextEditingController heartRateController = TextEditingController();

  int? heartRate;
  String resultText = "";

  void calculateHeartRate() {
    final int? age = int.tryParse(ageController.text);
    final int? bpm = int.tryParse(heartRateController.text);

    if (age == null || bpm == null || bpm <= 0) {
      setState(() {
        heartRate = null;
        resultText = "Please enter valid values.";
      });
      return;
    }

    String category;

    if (bpm < 60) {
      category = "Bradycardia (Low Heart Rate)";
    } else if (bpm <= 100) {
      category = "Normal";
    } else {
      category = "Tachycardia (High Heart Rate)";
    }

    setState(() {
      heartRate = bpm;
      resultText = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Heart Rate Checker",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            _inputCard(
              child: Column(
                children: [
                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Age",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: heartRateController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Heart Rate (BPM)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: calculateHeartRate,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text("Check Heart Rate"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            if (heartRate != null)
              _resultCard(),

          ],
        ),
      ),
    );
  }

  Widget _inputCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: child,
    );
  }

  Widget _resultCard() {
    Color resultColor;

    if (resultText.contains("Normal")) {
      resultColor = Colors.green;
    } else if (resultText.contains("Bradycardia")) {
      resultColor = Colors.orange;
    } else {
      resultColor = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: resultColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            "Your Heart Rate",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "$heartRate BPM",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: resultColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            resultText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: resultColor,
            ),
          ),
        ],
      ),
    );
  }
}