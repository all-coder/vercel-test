import 'package:flutter/material.dart';
import './store_card.dart';
// import '../screens/stall_screen.dart';
import '../models/models.dart';

class StoreSlider extends StatelessWidget {
  const StoreSlider({required this.foodItems, super.key});
  final List<Stall> foodItems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: foodItems.map((food) => StoreCard(stall: food)).toList(),
      ),
    );
  }
}