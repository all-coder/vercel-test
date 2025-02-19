// necessary imports

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// relative imports
import '../screens/home.dart';
class Interest extends StatefulWidget {
  const Interest({super.key});
  @override
  State<StatefulWidget> createState() {
    return _InterestState();
  }
}

// make the buttons more interesting, change UI and fonts per our standards
class _InterestState extends State<Interest> {
  final List<String> interests = [
    'Technology',
    'Pop Culture',
    'Art',
    'Cricket',
    'Philosophy',
    'Gaming',
    'Travel',
    'Food',
    'Hollywood',
    'South Indian',
    'Fitness',
    'Football',
    'Casual',
    'North Indian',
    'Nature'
  ];

  final List<String> selectedInterests = [];
  final int maxSelection = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.blueGrey.shade900
                ], // not sure about the background color exactly
              ),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("lib/assets/images/waves_background.png"),
          //       fit: BoxFit.cover,
          //       colorFilter: ColorFilter.mode(
          //         Colors.black
          //             .withAlpha((0.3 * 255).toInt()), //for the transparency
          //         BlendMode.dstATop,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose your interests',
                  style: GoogleFonts.firaMono(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${selectedInterests.length} of $maxSelection selected',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: interests.length,
                    itemBuilder: (context, index) {
                      String interest = interests[index];
                      bool isSelected = selectedInterests.contains(interest);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedInterests.remove(interest);
                            } else {
                              if (selectedInterests.length < maxSelection) {
                                selectedInterests.add(interest);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'You can only select up to $maxSelection interests.'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                            gradient: isSelected
                                ? LinearGradient(
                                    colors: [
                                      Colors.blueAccent,
                                      Colors.purpleAccent,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : LinearGradient(
                                    colors: [
                                      Colors.grey.shade900,
                                      Colors.grey.shade800,
                                    ],
                                  ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: Colors.blueAccent
                                          .withAlpha((0.6 * 255).toInt()),
                                      blurRadius: 20,
                                      spreadRadius: 1,
                                    )
                                  ]
                                : [],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              interest,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: selectedInterests.isNotEmpty
                        ? () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                              return Home();
                            }));
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Click in, Fest on',
                      style: GoogleFonts.spaceGrotesk(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
