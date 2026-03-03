import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDeveloperPage extends StatelessWidget {
  const AboutDeveloperPage({super.key});

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Widget developerCard(String name, String github, String linkedin) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 18),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text("Github"),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => openLink(github),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text("LinkedIn"),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => openLink(linkedin),
          ),
        ],
      ),
    );
  }

  Widget appDetailsCard() {
    return Container(
    //   margin: const EdgeInsets.symmetric(vertical: 12),
    //   padding: const EdgeInsets.all(16),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(18),
    //     boxShadow: const [
    //       BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))
    //     ],
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       const Text(
    //         "App Details",
    //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //       ),
    //       const SizedBox(height: 15),
    //       ListTile(
    //         contentPadding: EdgeInsets.zero,
    //         title: const Text("Version"),
    //         trailing: const Icon(Icons.open_in_new),
    //         onTap: () {},
    //       ),
    //       ListTile(
    //         contentPadding: EdgeInsets.zero,
    //         title: const Text("Help"),
    //         trailing: const Icon(Icons.open_in_new),
    //         onTap: () => openLink("https://www.geeksforgeeks.org/flutter/flutter-tutorial"),
    //       ),
    //     ],
    //   ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              "About Developer",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            developerCard(
              "Amay Tiwari",
              "https://github.com/amaytiwarii",
              "https://www.linkedin.com/in/amay-tiwari-2a14a9326/",
            ),
            developerCard(
              "Riya Wagh",
              "https://github.com/",
              "https://www.linkedin.com/in/riya-wagh-59a438341",
            ),
            appDetailsCard(),
          ],
        ),
      ),
    );
  }
}
