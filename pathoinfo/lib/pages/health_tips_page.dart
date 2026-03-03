import 'package:flutter/material.dart';

class HealthTipsPage extends StatelessWidget {
  const HealthTipsPage({super.key});

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
          "Health Maintenance",
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

            _tipCard(
              icon: Icons.local_drink,
              iconColor: Colors.blue,
              title: "Stay Hydrated",
              description:
              "Drink at least 2–3 liters of water daily to maintain proper body function and detoxification.",
            ),

            _tipCard(
              icon: Icons.directions_run,
              iconColor: Colors.green,
              title: "Exercise Regularly",
              description:
              "Engage in at least 30 minutes of moderate physical activity daily to improve heart and overall health.",
            ),

            _tipCard(
              icon: Icons.restaurant,
              iconColor: Colors.orange,
              title: "Balanced Diet",
              description:
              "Include fruits, vegetables, whole grains, and protein-rich foods in your daily meals.",
            ),

            _tipCard(
              icon: Icons.bedtime,
              iconColor: Colors.indigo,
              title: "Adequate Sleep",
              description:
              "Get 7–8 hours of quality sleep each night to support immune and mental health.",
            ),

            _tipCard(
              icon: Icons.monitor_heart,
              iconColor: Colors.red,
              title: "Regular Health Checkups",
              description:
              "Routine blood tests and screenings help detect diseases early and prevent complications.",
            ),

            _tipCard(
              icon: Icons.smoke_free,
              iconColor: Colors.teal,
              title: "Avoid Harmful Habits",
              description:
              "Avoid smoking, excessive alcohol, and processed foods to maintain long-term health.",
            ),

            _tipCard(
              icon: Icons.self_improvement,
              iconColor: Colors.purple,
              title: "Manage Stress",
              description:
              "Practice meditation, yoga, or breathing exercises to reduce stress and improve mental health.",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static Widget _tipCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
