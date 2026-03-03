import 'package:flutter/material.dart';
import 'disease_page.dart';
import 'about_page.dart';
import 'about_developer_page.dart';
import 'pathology_page.dart';
import 'health_tips_page.dart';
// import 'bmi_calculator_page.dart';
import 'bmi_diet_page.dart';
import 'heart_rate_checker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "PathoInfo",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DiseasesPage(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AboutDeveloperPage(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Developers",
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // TextField(
            //   decoration: InputDecoration(
            //     hintText: "Search diseases or tests",
            //     prefixIcon: const Icon(Icons.search),
            //     filled: true,
            //     fillColor: Colors.white,
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //       borderSide: BorderSide.none,
            //     ),
            //   ),
            // ),

            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome, Student",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "This app provides educational information about diseases "
                        "and pathology for students and patients.",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                _featureCard(
                  context: context,
                  icon: Icons.bug_report,
                  title: "Diseases",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DiseasesPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 12),
                _featureCard(
                  context: context,
                  icon: Icons.science,
                  title: "Pathology Info",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PathologyPage(),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AboutPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  child: const Row(
                    children: [
                      Icon(Icons.info_outline),
                      SizedBox(width: 12),
                      Text(
                        "About App",
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Quick Access",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // _listTile(
            //   context: context,
            //   icon: Icons.description,
            //   iconColor: Colors.blue.shade100,
            //   title: "Disease Information",
            //   subtitle: "Comprehensive medical guides",
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (_) => const DiseasesPage(),
            //       ),
            //     );
            //   },
            // ),

            // _listTile(
            //   context: context,
            //   icon: Icons.biotech,
            //   iconColor: Colors.green.shade100,
            //   title: "Pathology Tests",
            //   subtitle: "Understand your lab results",
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (_) => const PathologyPage(),
            //       ),
            //     );
            //   },
            // ),

            _listTile(
              context: context,
              icon: Icons.shield,
              iconColor: Colors.orange.shade100,
              title: "Health Maintenance",
              subtitle: "Health maintenance & tips",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HealthTipsPage(),
                  ),
                );
              },
            ),
            _listTile(
              context: context,
              icon: Icons.calculate,
              iconColor: Colors.purple.shade100,
              title: "Heart Rate Checker",
              subtitle: "Check your heart rate",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HeartRateChecker(),
                  ),
                );
              },
            ),
            _listTile(
              context: context,
              icon: Icons.food_bank,
              iconColor: Colors.purple.shade100,
              title: "Diet Planner",
              subtitle: "Get your diet according to your BMI",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BMICalculatorPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget _featureCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: Colors.blue),
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _listTile({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
