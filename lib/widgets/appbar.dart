//necessary imports 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// relative imports
// import './side_drawer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.title,super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff2A2626),
            width: 2,
          ),
        ),
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(11),
          bottomStart: Radius.circular(11),
        ),
        color: Color(0xff0A0908),
      ),
      width: double.infinity,
      child: Column(
        children: [
          // const SizedBox(
          //   height: 35,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                Text(
                  title,
                  style: GoogleFonts.ibmPlexMono(
                      fontSize: 40,
                      color: const Color(0xffFFFFFF),
                      fontWeight: FontWeight.w400),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.person_2,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
