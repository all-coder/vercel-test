//necessary imports
import 'package:flutter/material.dart';

// relative imports
import '../models/models.dart';


//final Event dummyEvent = Event(title: "EDM Night", location: "AB1", time: DateTime(2025, 2, 12, 20, 0));
final List<Event> events = [
  Event(
    title: "EDM Night",
    location: "AB1",
    time: DateTime(2025, 2, 12, 20, 0),
    background: Color(0xFF1B1F3B), // Deep Indigo
    foreground: Color(0xFFFFC857), // Warm Yellow
  ),
  Event(
    title: "Tech Talk",
    location: "Auditorium",
    time: DateTime(2025, 2, 13, 10, 30),
    background: Color(0xFF017374), // Teal Blue
    foreground: Color(0xFFF0F3BD), // Soft Cream
  ),
  Event(
    title: "Robotics Workshop",
    location: "Lab 3",
    time: DateTime(2025, 2, 14, 14, 0),
    background: Color(0xFF2D728F), // Blue Steel
    foreground: Color(0xFFF1F1F1), // Light Grey
  ),
  Event(
    title: "AI Seminar",
    location: "Hall B",
    time: DateTime(2025, 2, 15, 11, 0),
    background: Color(0xFF3A0CA3), // Vivid Purple
    foreground: Color(0xFFF7B801), // Sunset Orange
  ),
  Event(
    title: "Music Fest",
    location: "Open Grounds",
    time: DateTime(2025, 2, 16, 18, 0),
    background: Color(0xFFFF5E5B), // Coral Red
    foreground: Color(0xFF1E1E24), // Dark Charcoal
  ),
  Event(
    title: "Startup Pitch",
    location: "Conference Room",
    time: DateTime(2025, 2, 17, 9, 30),
    background: Color(0xFF00A896), // Mint Green
    foreground: Color(0xFFF8F9FA), // Soft White
  ),
  Event(
    title: "Movie Night",
    location: "Auditorium",
    time: DateTime(2025, 2, 18, 19, 0),
    background: Color(0xFF333533), // Dark Grey
    foreground: Color(0xFFF5CB5C), // Soft Gold
  ),
  Event(
    title: "Hackathon",
    location: "Lab 1",
    time: DateTime(2025, 2, 19, 8, 0),
    background: Color(0xFF0B3954), // Dark Navy Blue
    foreground: Color(0xFFFFD166), // Bright Yellow
  ),
  Event(
    title: "Gaming Tournament",
    location: "Hall C",
    time: DateTime(2025, 2, 20, 17, 0),
    background: Color(0xFF780000), // Rich Maroon
    foreground: Color(0xFFF4E04D), // Soft Yellow
  ),
  Event(
    title: "Closing Ceremony",
    location: "Main Stage",
    time: DateTime(2025, 2, 21, 20, 0),
    background: Color(0xFF14213D), // Deep Blue
    foreground: Color(0xFFFCA311), // Warm Orange
  ),
];

