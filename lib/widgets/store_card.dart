import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class StoreCard extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String date;
  final String imageUrl;
  final Color backgroundColor;

  const StoreCard({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.date,
    required this.imageUrl,
    required this.backgroundColor,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
            child: Image.network(
              imageUrl,
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
                  title,
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
                      location,
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
                      price,
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
                      date,
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