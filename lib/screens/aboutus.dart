import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Relative imports
import '../widgets/appbar.dart';
import '../widgets/side_drawer.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      backgroundColor: const Color(0xff0A0908),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom App Bar
          const CustomAppBar(title: "About Us"),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "The Team",
                    style: GoogleFonts.ibmPlexMono(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Where Innovation Meets Celebration",
                    style: GoogleFonts.ibmPlexMono(
                      fontSize: 20,
                      color: const Color(0xff63675D),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // About Cards
                  _buildInfoCard(
                    title: "Ritvik Ravi",
                    description:
                    "Ritvik is the one who saw a vision and also then soon saw it turn into a reality. An energetic app developer, buzzing with ideas, ritvik has been the biggest supporter, the man behind it all.",
                  ),
                  _buildInfoCard(
                    title: "Anvay Joshi",
                    description:
                    "Anvay, enthusiastic and energetic about software development, was just exploring the depths and possibilities of app development when he stumbled upon this team and decided to join in and make this app come to life.",
                  ),
                  _buildInfoCard(
                    title: "Anirudh Arrepu",
                    description:
                    "A proficient programmer in himself, Anirudh is all about delivering the best outcomes in the least amount of time. This man really knows what he is doing!",
                  ),
                  _buildInfoCard(
                    title: "Niranjan M",
                    description:
                    "This man is knee-deep into app development and web development and is known to procure fully functioning features out of thin air! This man is a real Ninja when it comes to Software Development!",
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Card Widget for Information
  Widget _buildInfoCard({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xff1B1B1B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.ibmPlexMono(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.ibmPlexMono(
                fontSize: 16,
                color: Colors.white70,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}