import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// relative imports
import '../widgets/appbar.dart';
import '../widgets/event.dart';
import '../widgets/side_drawer.dart';
import '../widgets/store_slider.dart';
import '../widgets/annoucement_tile.dart';

// dump all event and stalls data into this directory.
import '../data/stalls.dart';
import '../data/events.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // for now, will make it dynamic, connect it to firestore.
    const announcements = {
      "Paintball registration will be closing soon, at 3pm! Come ASAP":
          "7:30pm, 21st Feb,2025",
      "Horror House closing times have been postponed to 11pm. Enjoy!":
          "5:15pm, 20st Feb,2025",
    };
    return Scaffold(
      drawer: SideDrawer(),
      backgroundColor: const Color(0xff0A0908),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Custom app bar
          const CustomAppBar(
            title: "TIRUTSUVA",
          ),
          // Main scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff0A0908),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/waves_background.png", // Background vector
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "NEON DREAMS. PURE EUPHORIA.",
                      style: GoogleFonts.ibmPlexMono(
                        fontSize: 23,
                        color: const Color(0xffAFFC41),
                       // color: const Color(0xff63675D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    EventCarousel(events: events),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Wanna Grab A Bite?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ibmPlexMono(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StoreSlider(
                      foodItems: stalls,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Center(
                        child: Text(
                          "Announcements",
                          style: GoogleFonts.ibmPlexMono(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ...announcements.entries.map(
                      (entry) {
                        return AnnouncementTile(
                          announcement: entry.key,
                          date: entry.value,
                        );
                      },
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
