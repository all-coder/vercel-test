import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart'; 

import '../models/models.dart';

class EventTile extends StatelessWidget {
  const EventTile({required this.event, super.key});
  final Event event;

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('h a').format(event.time);
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("lib/assets/images/waves_background.png"),
          fit: BoxFit.fill,
        ),
        color: event.background,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4.5,
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 5),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 10,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 60, 
              child: Text(
                event.title,
                style: GoogleFonts.dmMono(
                  fontSize: 30,
                  color: event.foreground,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 68,
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: event.foreground,
                  size: 35,
                ),
                SizedBox(width: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100, 
                  child: Text(
                    event.location,
                    style: GoogleFonts.dmMono(
                      fontSize: 25,
                      color: event.foreground,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            top: 130,
            child: Row(
              children: [
                Icon(
                  Icons.access_time_outlined,
                  color: event.foreground,
                  size: 35,
                ),
                SizedBox(width: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100, 
                  child: Text(
                    "$formattedTime onwards",
                    style: GoogleFonts.dmMono(
                      fontSize: 25,
                      color: event.foreground,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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

class EventCarousel extends StatelessWidget {
  const EventCarousel({required this.events, super.key});
  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true, 
        autoPlayInterval: Duration(seconds: 3), 
        autoPlayAnimationDuration: Duration(milliseconds: 800), 
        autoPlayCurve: Curves.easeInOut,
        viewportFraction: 1,
        enableInfiniteScroll: false,
      ),
      items: events.map((i) => EventTile(event: i)).toList(),
    );
  }
}


// --------------------//
// uncomment this code for date-based filtering and delete the code right above this code //

// class EventCarousel extends StatelessWidget {
//   const EventCarousel({required this.events, super.key});
//   final List<Event> events;

//   @override
//   Widget build(BuildContext context) {
//     DateTime today = DateTime.now();
//     List<Event> todayEvents = events.where((event) {
//       return event.time.year == today.year &&
//              event.time.month == today.month &&
//              event.time.day == today.day;
//     }).toList();

//     return todayEvents.isEmpty
//         ? Center(
//             child: Text(
//               "No events for today",
//               style: GoogleFonts.dmMono(fontSize: 20, fontWeight: FontWeight.w400),
//             ),
//           )
//         : CarouselSlider(
//             options: CarouselOptions(
//               enlargeCenterPage: true,
//               autoPlay: true,
//               autoPlayInterval: Duration(seconds: 3),
//               autoPlayAnimationDuration: Duration(milliseconds: 800),
//               autoPlayCurve: Curves.easeInOut,
//               viewportFraction: 1,
//               enableInfiniteScroll: false,
//             ),
//             items: todayEvents.map((event) => EventTile(event: event)).toList(),
//           );
//   }
// }
