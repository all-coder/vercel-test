import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tirutsava/widgets/side_drawer.dart';
import '/widgets/appbar.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GalleryScreen(),
    );
  }
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<String> imagePaths = [
    'lib/assets/images/image1.jpg',
    'lib/assets/images/image2.jpg',
    'lib/assets/images/image3.jpg',
    'lib/assets/images/image4.jpg',
    'lib/assets/images/image5.jpg',
    'lib/assets/images/image6.jpg',
    'lib/assets/images/image7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      backgroundColor: const Color(0xff0A0908),
      body: Stack(
        children: [
          // Black background
          Container(color: const Color(0xff0A0908)),

          // Background Image Overlay
          Positioned.fill(
            child: Opacity(
              opacity: 0.2, // Adjust transparency if needed
              child: Image.asset(
                "lib/assets/images/waves_background.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main content
          Column(
            children: [
              const CustomAppBar(title: "Gallery"),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StaggeredGrid.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: List.generate(
                        imagePaths.length,
                        (index) => _buildImageTile(imagePaths[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
}

  Widget _buildImageTile(String imagePath) {
    final Random random = Random();
    int width = 1 + random.nextInt(2); // Random width: 1 or 2
    int height = 1 + random.nextInt(3); // Random height: 1, 2, or 3

    return StaggeredGridTile.count(
      crossAxisCellCount: width,
      mainAxisCellCount: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
