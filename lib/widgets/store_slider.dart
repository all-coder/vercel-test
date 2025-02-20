import './store_card.dart';
import 'package:flutter/material.dart';

class StoreSlider extends StatelessWidget {
  const StoreSlider({required this.foodItems, super.key});
  final List<Map<String, dynamic>> foodItems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: foodItems.map((food) {
          return StoreCard(
            title: food["title"],
            location: food["location"],
            price: food["price"],
            date: food["date"],
            imageUrl: food["imageUrl"],
            backgroundColor: food["color"],
          );
        }).toList(),
      ),
    );
  }
}
