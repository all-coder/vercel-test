//necessary imports
import 'package:flutter/material.dart';

// relative imports
import '../models/models.dart';


final List<Event> events = [
  Event(
    title: "Squid Games",
    location: "CR 211",
    time: DateTime(2025, 2, 10, 9, 0),
    background: Color(0xFF1B1F3B), // Deep Indigo
    foreground: Color(0xFFFFC857), // Warm Yellow
  ),
  Event(
    title: "One ON",
    location: "LHC",
    time: DateTime(2025, 2, 10, 13, 0),
    background: Color(0xFF017374), // Teal Blue
    foreground: Color(0xFFFFF3E4), // Off White
  ),
  Event(
    title: "Just a Minute",
    location: "CR 002",
    time: DateTime(2025, 2, 10, 13, 0),
    background: Color(0xFF2D728F), // Blue Steel
    foreground: Color(0xFFFFE066), // Soft Gold
  ),
  Event(
    title: "Journey for Riches",
    location: "CR 001",
    time: DateTime(2025, 2, 10, 14, 30),
    background: Color(0xFF3A0CA3), // Vivid Purple
    foreground: Color(0xFFFFE4C4), // Soft Beige
  ),
  Event(
    title: "Analog Mastery-Finals",
    location: "CR 002",
    time: DateTime(2025, 2, 10, 14, 0),
    background: Color(0xFFFF5E5B), // Coral Red
    foreground: Color(0xFFF8F9FA), // Soft White
  ),
  Event(
    title: "Squid Games Finale",
    location: "LHC",
    time: DateTime(2025, 2, 11, 10, 0),
    background: Color(0xFF00A896), // Mint Green
    foreground: Color(0xFFF8F1E5), // Cream White
  ),
  Event(
    title: "Murder Mystery",
    location: "CR 001",
    time: DateTime(2025, 2, 11, 9, 0),
    background: Color(0xFF1E1E24), // Dark Charcoal
    foreground: Color(0xFFFFD700), // Bright Gold
  ),
  Event(
    title: "Rap Battle",
    location: "North OAT",
    time: DateTime(2025, 2, 11, 12, 0),
    background: Color(0xFF0B3954), // Dark Navy Blue
    foreground: Color(0xFFFFF4A3), // Soft Yellow
  ),
  Event(
    title: "Street Play",
    location: "In front of AB1",
    time: DateTime(2025, 2, 11, 14, 0),
    background: Color(0xFF780000), // Rich Maroon
    foreground: Color(0xFFFFD1E3), // Soft Pink
  ),
  Event(
    title: "KBC",
    location: "CR 006",
    time: DateTime(2025, 2, 11, 14, 0),
    background: Color(0xFF14213D), // Deep Blue
    foreground: Color(0xFFFFC300), // Golden Yellow
  ),
  Event(
    title: "Escape Room",
    location: "CR 004",
    time: DateTime(2025, 2, 11, 9, 0),
    background: Color(0xFF6A0572), // Dark Purple
    foreground: Color(0xFFF0F3BD), // Soft Cream
  ),
  Event(
    title: "Speed Dating",
    location: "In front of AB1",
    time: DateTime(2025, 2, 11, 17, 0),
    background: Color(0xFF1B1A55), // Midnight Blue
    foreground: Color(0xFFF3D9DC), // Light Pink
  ),
  Event(
    title: "Treasure Hunt",
    location: "CR 006",
    time: DateTime(2025, 2, 12, 9, 0),
    background: Color(0xFF007200), // Dark Green
    foreground: Color(0xFFFFF4E0), // Soft Beige
  ),
  Event(
    title: "Stew",
    location: "CR 001",
    time: DateTime(2025, 2, 12, 9, 0),
    background: Color(0xFF5A189A), // Royal Purple
    foreground: Color(0xFFFFD700), // Bright Gold
  ),
  Event(
    title: "Pop Culture Quiz",
    location: "CR 002",
    time: DateTime(2025, 2, 12, 12, 0),
    background: Color(0xFF2A9D8F), // Soft Teal
    foreground: Color(0xFFFFB703), // Golden Yellow
  ),
  Event(
    title: "Tech Heist-Finals",
    location: "CR 002",
    time: DateTime(2025, 2, 12, 14, 0),
    background: Color(0xFF6A0572), // Dark Purple
    foreground: Color(0xFFF1FAEE), // Soft White
  ),
  Event(
    title: "Cricket O Mania",
    location: "CR 001",
    time: DateTime(2025, 2, 12, 14, 0),
    background: Color(0xFF9A031E), // Deep Red
    foreground: Color(0xFFFFF4E0), // Soft Beige
  ),
];

