import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tirutsava/widgets/side_drawer.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '/widgets/appbar.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final ImagePicker _picker = ImagePicker();
  List<Uint8List> _selectedImages = [];
  final TextEditingController _instaIdController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();

  // Function to pick multiple images from the gallery
  Future<void> _pickImages() async {
    try {
      final List<XFile> pickedFiles =
          await _picker.pickMultiImage(imageQuality: 100);

      if (pickedFiles.isNotEmpty) {
        List<Uint8List> images = [];
        for (var file in pickedFiles) {
          Uint8List bytes = await file.readAsBytes();
          images.add(bytes);
        }

        setState(() {
          _selectedImages = images;
        });
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  // Function to upload images to Firebase Storage and create a Firestore entry
  Future<void> _uploadContent() async {
    print("submit button clicked");
    if (_selectedImages.isEmpty ||
        _instaIdController.text.isEmpty ||
        _captionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please complete all fields and select images.")),
      );
      return;
    }

    try {
      print("trying");
      // Create a Firestore document
      CollectionReference posts =
          FirebaseFirestore.instance.collection('posts');
      DocumentReference newPost = posts.doc();

      print("document fetched");
      // Upload images to Firebase Storage
      List<String> imageUrls = [];
      // print(_selectedImages.length);
      // for (int i = 0; i < _selectedImages.length; i++) {
      //   String filePath = 'uploads/${newPost.id}/image_$i.png';
      //   Reference ref = FirebaseStorage.instance.ref().child(filePath);
      //   UploadTask uploadTask = ref.putData(_selectedImages[i]);
      //   TaskSnapshot snapshot = await uploadTask;
      //   String downloadUrl = await snapshot.ref.getDownloadURL();
      //   imageUrls.add(downloadUrl);
      // }

      print("after for loop");

      // Add entry to Firestore
      await newPost.set({
        'instaId': _instaIdController.text,
        'caption': _captionController.text,
        // 'imageUrls': imageUrls,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Content uploaded successfully!")),
      );

      print("going on");

      // Clear fields after successful upload
      setState(() {
        _selectedImages.clear();
        _instaIdController.clear();
        _captionController.clear();
      });
    } catch (e) {
      print("Error uploading content: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to upload content.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      backgroundColor: const Color(0xff0A0908),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "lib/assets/images/waves_background.png", // Replace with your image path
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),
          Column(
            children: [
              const CustomAppBar(title: "Reminisce"),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: _pickImages,
                        child: Container(
                          height: 200,
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 50, 49, 49),
                          ),
                          child: _selectedImages.isNotEmpty
                              ? CarouselSlider(
                                  options: CarouselOptions(
                                    height: 180,
                                    enlargeCenterPage: true,
                                    enableInfiniteScroll: true,
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    viewportFraction: 0.8,
                                  ),
                                  items: _selectedImages.map((image) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.memory(
                                        image,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    );
                                  }).toList(),
                                )
                              : Center(
                                  child: Text(
                                    "Click to upload your photo(s)",
                                    style: GoogleFonts.firaMono(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff4F4D4D)),
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Container(
                      //   padding: const EdgeInsets.fromLTRB(0,10, 10, 10),
                      //   width: double.infinity,
                      //   margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      //   height: 40,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(5),
                      //     color: const Color.fromARGB(255, 50, 49, 49),
                      //   ),
                      //   child: TextField(
                      //     controller: _instaIdController,
                      //     style: const TextStyle(color: Colors.white),
                      //     decoration: const InputDecoration(
                      //       prefixIcon: Icon(Ionicons.logo_instagram,color: Colors.grey,),
                      //       hintText: "Enter your Instagram ID",
                      //       hintStyle: TextStyle(
                      //           color: Color.fromARGB(107, 167, 167, 167)),
                      //       border: InputBorder.none,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 50, 49, 49),
                        ),
                        child: TextField(
                          controller: _instaIdController,
                          style: GoogleFonts.firaMono(color: Colors.white),
                          decoration: const InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 4, right: 5),
                              child: Icon(Ionicons.logo_instagram,
                                  color: Colors.grey),
                            ),
                            hintText: "Enter your Instagram ID",
                            hintStyle: TextStyle(
                              color: Color.fromARGB(107, 167, 167, 167),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      // Container(
                      //   padding: const EdgeInsets.all(10),
                      //   width: double.infinity,
                      //   height: 150,
                      //   margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(5),
                      //     color: const Color.fromARGB(255, 50, 49, 49),
                      //   ),
                      //   child: TextField(
                      //     controller: _captionController,
                      //     style: const TextStyle(color: Colors.white),
                      //     maxLines: 5,
                      //     decoration: const InputDecoration(
                      //       hintText: "Enter your caption",
                      //       hintStyle: TextStyle(
                      //           color: Color.fromARGB(107, 167, 167, 167)),
                      //       border: InputBorder.none,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        width: double.infinity,
                        height: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 50, 49, 49),
                        ),
                        child: TextField(
                          controller: _captionController,
                          style: GoogleFonts.firaMono(
                              color: Colors.white), // Apply Fira Mono
                          maxLines: 5,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  top: 3, right: 10), // Align icon properly
                              child: const Icon(Ionicons.create,
                                  color: Colors.grey),
                            ),
                            hintText: "Enter your captions...",
                            hintStyle: GoogleFonts.firaMono(
                              fontSize: 18,
                              color: const Color.fromARGB(107, 167, 167, 167),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 10), // Adjusts text padding
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor:
                              const Color.fromARGB(213, 238, 109, 77),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _uploadContent,
                        child: Text("Upload",
                            style: GoogleFonts.firaMono(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _instaIdController.dispose();
    _captionController.dispose();
    super.dispose();
  }
}
