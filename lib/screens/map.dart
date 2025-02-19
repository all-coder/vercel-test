import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

// Relative imports
import '../widgets/appbar.dart';
import '../widgets/side_drawer.dart';

class Map extends StatelessWidget {
  const Map({required this.mapImagePath, super.key});
  final String mapImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      backgroundColor: const Color(0xff0A0908),
      body: Column(
        children: [
          const CustomAppBar(title: "Map"),
          Expanded(
            child: PhotoView(
              imageProvider: AssetImage(mapImagePath),
              minScale: PhotoViewComputedScale.covered,
              maxScale: PhotoViewComputedScale.covered * 4.0,
              initialScale: PhotoViewComputedScale.covered,
              backgroundDecoration: const BoxDecoration(
                color: Color(0xff0A0908),
              ),
              enableRotation: false,
              heroAttributes: const PhotoViewHeroAttributes(tag: "map"),
              basePosition: Alignment.center,
              scaleStateController: PhotoViewScaleStateController(),
              gestureDetectorBehavior: HitTestBehavior.opaque,
            ),
          ),
        ],
      ),
    );
  }
}
