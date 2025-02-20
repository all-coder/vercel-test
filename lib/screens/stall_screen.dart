import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/models.dart';
import '../data/stalls.dart';

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
        Container(
          color: Colors.blue,
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
