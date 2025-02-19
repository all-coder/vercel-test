import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tirutsava/widgets/side_drawer.dart';
import '/widgets/appbar.dart';

class Gallery extends StatelessWidget {
  const Gallery({required this.imagePaths,super.key});
  final List<String> imagePaths;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GalleryScreen(imagePaths: imagePaths,),
    );
  }
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({required this.imagePaths,super.key});

  final List<String> imagePaths;

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {

  final Random random = Random();
  late List<int> tileConfigurations;
  String? selectedImage;

  @override
  void initState() {
    super.initState();
    tileConfigurations = List.generate(widget.imagePaths.length, (index) => random.nextInt(3) + 1);
  }

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
                        widget.imagePaths.length,
                        (index) => _buildImageTile(widget.imagePaths[index], index),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Image Popup
          if (selectedImage != null)
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              },
              child: GestureDetector(
                onTap: () => setState(() => selectedImage = null),
                child: Container(
                  color: Colors.black.withOpacity(0.8),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(selectedImage!, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImageTile(String imagePath, int index) {
    int width = 1 + (tileConfigurations[index] % 2); 
    int height = 1 + (tileConfigurations[index] % 3); 

    return StaggeredGridTile.count(
      crossAxisCellCount: width,
      mainAxisCellCount: height,
      child: GestureDetector(
        onTap: () => setState(() => selectedImage = imagePath),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
