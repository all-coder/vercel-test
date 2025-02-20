import 'package:flutter/material.dart';
import './store_card.dart';
import '../screens/stall_screen.dart';
import '../models/models.dart';

class StoreSlider extends StatelessWidget {
  const StoreSlider({required this.foodItems, super.key});
  final List<Stall> foodItems;

  @override
  Widget build(BuildContext context) {
    final int maxItems = 5;
    final bool shouldShowMore = foodItems.length > maxItems;
    final List<Stall> displayedItems =
        foodItems.take(maxItems).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...displayedItems.map(
            (food) {
              return StoreCard(stall:food);
            },
          ),
          if (shouldShowMore)
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return StallScreen();
                }));
              },
              child: const Text("Show More"),
            ),
        ],
      ),
    );
  }
}
