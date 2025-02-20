import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/models.dart';
class StoreCard extends StatelessWidget {
const StoreCard({required this.stall,super.key});
final Stall stall;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: stall.color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
            child: Image.network(
              stall.imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stall.name,
                  style:  GoogleFonts.ibmPlexMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.white),
                ),
                SizedBox(height: 4),
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
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.attach_money, color: Colors.white70, size: 16),
                    SizedBox(width: 4),
                    Text(
                      stall.price,
                      style: GoogleFonts.ibmPlexMono(
                  fontWeight: FontWeight.w400,
                  fontSize:15,
                  color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.white70, size: 16),
                    SizedBox(width: 4),
                    Text(
                      stall.date,
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
}