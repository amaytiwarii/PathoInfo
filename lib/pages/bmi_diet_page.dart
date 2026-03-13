import 'package:flutter/material.dart';
import 'dart:math';

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({super.key});

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double? bmi;
  String resultText = "";

  /// BMI CALCULATION
  void calculateBMI() {
    final double? heightCm = double.tryParse(heightController.text);
    final double? weightKg = double.tryParse(weightController.text);

    if (heightCm == null || weightKg == null || heightCm <= 0) {
      setState(() {
        bmi = null;
        resultText = "Please enter valid values.";
      });
      return;
    }

    final double heightM = heightCm / 100;
    final double calculatedBMI = weightKg / pow(heightM, 2);

    String category;

    if (calculatedBMI < 18.5) {
      category = "Underweight";
    } else if (calculatedBMI < 24.9) {
      category = "Normal Weight";
    } else if (calculatedBMI < 29.9) {
      category = "Overweight";
    } else {
      category = "Obese";
    }

    setState(() {
      bmi = calculatedBMI;
      resultText = category;
    });
  }

  ///  DIET RECOMMENDATION
  Map<String, List<String>> getDietPlan(String category) {
    switch (category) {
      case "Underweight":
        return {
          "eat": [
            "Bananas",
            "Peanut butter",
            "Milk & dairy products",
            "Rice & potatoes",
            "Dry fruits"
          ],
          "avoid": [
            "Skipping meals",
            "Excess tea/coffee",
            "Junk food only diet"
          ],
          "tips": [
            "Eat every 3 hours",
            "Increase protein intake",
            "Strength training recommended"
          ]
        };

      case "Normal Weight":
        return {
          "eat": [
            "Fruits & vegetables",
            "Whole grains",
            "Lean protein",
            "Nuts & seeds"
          ],
          "avoid": [
            "Excess sugar",
            "Too much fried food"
          ],
          "tips": [
            "Maintain active lifestyle",
            "Drink 2–3L water daily",
            "30 min daily walk"
          ]
        };

      case "Overweight":
        return {
          "eat": [
            "Salads",
            "Oats",
            "Boiled vegetables",
            "Green tea",
            "High fiber foods"
          ],
          "avoid": [
            "Sugary drinks",
            "White bread",
            "Fried food",
            "Late night eating"
          ],
          "tips": [
            "Calorie deficit diet",
            "45 min walking daily",
            "Avoid snacking"
          ]
        };

      default: // Obese
        return {
          "eat": [
            "Vegetable soups",
            "Grilled food",
            "Millets",
            "Protein rich diet"
          ],
          "avoid": [
            "Fast food",
            "Bakery items",
            "Soft drinks",
            "Processed snacks"
          ],
          "tips": [
            "Structured weight loss plan",
            "Daily exercise compulsory",
            "Consult dietician"
          ]
        };
    }
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
          "BMI Calculator",
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
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Height (cm)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Weight (kg)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: calculateBMI,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text("Calculate BMI"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            if (bmi != null) _resultCard(),
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

    if (resultText == "Normal Weight") {
      resultColor = Colors.green;
    } else if (resultText == "Underweight") {
      resultColor = Colors.orange;
    } else {
      resultColor = Colors.red;
    }

    final diet = getDietPlan(resultText);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: resultColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Center(
            child: Column(
              children: [
                Text(
                  "Your BMI",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  bmi!.toStringAsFixed(2),
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
          ),

          const SizedBox(height: 20),

          _dietSection("Recommended Foods 🍎", diet["eat"]!),
          _dietSection("Avoid 🚫", diet["avoid"]!),
          _dietSection("Lifestyle Tips 💡", diet["tips"]!),
        ],
      ),
    );
  }

  Widget _dietSection(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          ...items.map(
                (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text("• $item"),
            ),
          ),
        ],
      ),
    );
  }
}
