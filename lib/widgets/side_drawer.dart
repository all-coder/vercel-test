// necessary imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tirutsava/screens/home.dart';

// relative imports
import '../screens/aboutus.dart';
import '../screens/uploadpage.dart';
import '../screens/gallery.dart';
import '../screens/map.dart';
import '../data/image_paths.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff0A0908),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => Home(),
                ),
              );
            },
            leading: const Icon(
              Icons.home,
              size: 26,
              color: Color(0xff2F2E2E),
            ),
            title: Text(
              'Home',
              style: GoogleFonts.ibmPlexMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => UploadPage()),
              );
            },
            leading: const Icon(
              Icons.camera,
              size: 26,
              color: Color(0xff2F2E2E),
            ),
            title: Text(
              'Reminisce',
              
              style: GoogleFonts.ibmPlexMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => Gallery(imagePaths: imagePaths,)),
              );
            },
            leading: const Icon(
              Icons.photo_size_select_actual_outlined,
              size: 26,
              color: Color(0xff2F2E2E),
            ),
            title: Text(
              'Gallery',
              style: GoogleFonts.ibmPlexMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (ctx) =>
                        Map(mapImagePath: "lib/assets/images/map.jpg")),
              );
            },
            leading: const Icon(
              Icons.map_outlined,
              size: 26,
              color: Color(0xff2F2E2E),
            ),
            title: Text(
              'Map',
              style: GoogleFonts.ibmPlexMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => AboutUs()),
              );
            },
            leading: const Icon(
              Icons.info_outline,
              size: 26,
              color: Color(0xff2F2E2E),
            ),
            title: Text(
              'About Us',
              style: GoogleFonts.ibmPlexMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
