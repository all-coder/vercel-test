import 'package:flutter/material.dart';
class Event{
  const Event({required this.title, required this.location, required this.time, required this.background, required this.foreground});
  final String title;
  final String location;
  final DateTime time; 
  final Color foreground;
  final Color background;
}

class Stall {
  const Stall({
    required this.name,
    required this.location,
    required this.price,
    required this.date,
    required this.imageUrl,
    required this.color,
  });

  final String name;
  final String location;
  final String price;
  final String date;
  final String imageUrl;
  final Color color;
}
