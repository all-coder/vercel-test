import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/models.dart';
import '../data/stalls.dart';


// stall screen felt needless, hence discontinuing it.
Widget stallCard({required BuildContext context, required Stall stall}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double cardWidth = screenWidth - 20;

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    width: cardWidth,
    color: Colors.amber,
    height: 150,
    child: Row(
      children: [
        SizedBox(
          //color: Colors.blue,
          width: 0.4 * cardWidth,
          height: double.infinity,
          child: Image.network(
            stall.imageUrl,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 0.6 * cardWidth,
          color: Colors.red,
          //margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              Text(
                stall.name,
                style: GoogleFonts.ibmPlexMono(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Colors.white),
              ),
              const SizedBox(height: 10,),
              Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white70, size: 16),
                    SizedBox(width: 4),
                    Text(
                      stall.location,
                      style:  GoogleFonts.ibmPlexMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.white),
                    ),
                  ],
                ),

            ],
          ),
        ),
      ],
    ),
  );
}

class StallScreen extends StatelessWidget {
  const StallScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0908),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Stalls",
          style: GoogleFonts.ibmPlexMono(
              fontSize: 40,
              color: const Color(0xffFFFFFF),
              fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color(0xff0A0908),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            stallCard(context: context, stall: stalls[0])
          ],
        ),
      ),
    );
  }
}
