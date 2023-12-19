// import 'dart:typed_data';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'package:image_picker/image_picker.dart';
// import 'package:projects/utils/color_utils.dart';
// import 'package:projects/utils/selectImage_utils.dart';
// import 'package:projects/water/mainmenu.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   Uint8List? _image;
//
//   void selectImage() async{
//     Uint8List img = await pickImage(ImageSource.gallery);
//     setState((){
//       _image=img;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       extendBodyBehindAppBar: true, appBar: AppBar(
//       actions: <Widget>[
//
//         IconButton(
//           icon: Icon(Icons.menu),
//           color: Colors.white,
//           iconSize: 30,
//           onPressed: () {
//             //icon for main menu not visible
//             // FirebaseAuth.instance.signOut().then((value) {
//             //   print("signed out");
//               Navigator.push(context,
//                   MaterialPageRoute (builder: (context) => NavDrawer()));
//             //});
//           }
//         ),],
//
//       automaticallyImplyLeading: false,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       title: const Text(
//         "SAMPLE DESK",
//         style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.white),
//       ),
//     ),
//
//       body:Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [
//             hexStringToColor("074548"),
//             hexStringToColor("bb6162"),
//             hexStringToColor("87a48d"),
//           ], begin: Alignment.topCenter, end: Alignment.bottomCenter
//           ),
//         ),
//
//         child:
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 120,
//               ),
//               Text(
//                 "Add X-RAY : ",
//                 textAlign: TextAlign.right,
//                 style:
//                 TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   fontStyle: FontStyle.italic,
//                   color: Colors.greenAccent.shade200,
//                   //fontFamily: '',
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Stack(
//                 children: [
//
//                   _image != null?
//                       CircleAvatar(
//                         radius: 65,
//                         backgroundImage: MemoryImage(_image!),
//                       )
//                   :
//                   const CircleAvatar(
//                     radius: 65 ,
//                     backgroundImage: NetworkImage('https://www.tgsin.in/images/joomlart/demo/default.jpg'),
//                   ),
//                   Positioned(
//                       child:
//                       IconButton(
//                         onPressed: selectImage,
//                         icon: const Icon(Icons.add_a_photo),
//                       ),
//                     bottom: -10,
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 23,
//               ),
//               Text(
//                 "Upload here",
//                 textAlign: TextAlign.right,
//                 style:
//                 TextStyle(
//                   fontSize: 18,
//                   //fontWeight: FontWeight.bold,
//                   //fontStyle: FontStyle.italic,
//                   color: Colors.black,
//                 ),
//               ),
//               //Image(image: AssetImage("assets/lungs.png")),
//               const SizedBox(
//                 height: 70,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//
//                 },
//                 child: Text("Predict"),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.blue, // Set your preferred button color
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 ),
//               ),
//               IconButton(
//                 onPressed: (){
//                   FirebaseAuth.instance.signOut().then((value) {
//                     print("signed out");
//                     Navigator.push(context,
//                         MaterialPageRoute (builder: (context) => SignInScreen()));
//                   });
//                 },
//                 icon: Icon(Icons.exit_to_app),
//                 iconSize: 50,
//                 color: Colors.black87,
//                 //alignment:Alignment.bottomLeft,
//               ),
//             ],
//           ),
//       //   child: ElevatedButton(
//       //     child: Text(
//       //     //TextAlign
//       //       "LogOut",
//       //   ),
//       //   onPressed: (){
//       //     Navigator.push(context,
//       //         MaterialPageRoute (builder: (context) => HomeScreen()));
//       //   },
//       // ),
//       ),
//     );
//   }
// }
//
// Future<void> diagnoseSkinCancer() async {
//   try {
//     if (pickedImage == null) {
//       setState(() {
//         selectImage = 'No image selected';
//       });
//       return;
//     }
//
//     // Convert the image to bytes
//     List<int> imageBytes = await pickedImage!.readAsBytes();
//     // Encode image bytes to base64
//     String base64Image = base64Encode(imageBytes);
//
//     String url = 'http://localhost:5000';
//     http.Response response = await http.post(
//         Uri.parse(url)
//       // data: {
//       //   'image': base64Image,
//       // }
//     );
//
//     if (response.statusCode == 200) {
//       // Handle success
//       setState(() {
//         diagnosisResult = response.body;
//       });
//     } else {
//       print('Failed to send data. Status code: ${response.statusCode}');
//       setState(() {
//         diagnosisResult = 'Failed to diagnose skin cancer';
//       });
//     }
//   }
//   catch (e) {
//     print('Error diagnosing skin cancer: $e');
//     setState(() {
//       diagnosisResult = 'Error diagnosing skin cancer';
//     });
//   }
// }
// }
//////////////////////////////////////////////////
/////////////////////////////////////////////////

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects/reusable_widget/reusable_widget.dart';
import 'package:projects/utils/color_utils.dart';
import 'package:projects/water/mainmenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? pickedImage;
  String? diagnosisResult;

  void showImagePickerOptions(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from Gallery'),
              onTap: () async {
                Navigator.pop(context);
                await pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Take a Photo'),
              onTap: () async {
                Navigator.pop(context);
                await pickImage(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() {
        pickedImage = file;
      });
    }
  }

  String? currentUserId = FirebaseAuth.instance.currentUser?.uid;

  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();

  Future<void> fetchUserData() async {
    try {
      final snapshot =
      await FirebaseFirestore.instance.collection('users').doc(currentUserId).get();

      if (snapshot.exists) {
        final data = snapshot.data();

        userName.text = data?['name'];
        userEmail.text = data?['email'];
      } else {
        Get.snackbar("Error", "User not found!");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch user data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: <Widget>[

          IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                //icon for main menu not visible
                // FirebaseAuth.instance.signOut().then((value) {
                //   print("signed out");
                Navigator.push(context,
                    MaterialPageRoute (builder: (context) => NavDrawer()));
                //});
              }
          ),],
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Sample Desk',
          style: TextStyle(
            fontFamily: 'YoungSerif',
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // drawer: Drawer(
      //   child: NavDrawer(userName: userName.text, email: userEmail.text),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("074548"),
              hexStringToColor("bb6162"),
              hexStringToColor("87a48d"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: fetchUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.indigo, width: 5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(80)),
                              ),
                              child: ClipOval(
                                child: pickedImage != null
                                    ? Image.file(pickedImage!)
                                    : logoWidget("assets/lungs.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            showImagePickerOptions(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors
                                .white.withOpacity(0.6), // Set the background color to black
                          ),
                          child: Text(' Upload Image ',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          await diagnoseSkinCancer();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors
                              .white.withOpacity(0.6), // Set the background color to black
                        ),
                        child: Text('Diagnose Pneomothorax',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 40),
                      if (diagnosisResult != null)
                        Text(
                          'Diagnosis Result: $diagnosisResult',
                          style: TextStyle(color: Colors.white70,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> diagnoseSkinCancer() async {
    try {
      if (pickedImage == null) {
        setState(() {
          diagnosisResult = 'No image selected';
        });
        return;
      }

      // Convert the image to bytes
      List<int> imageBytes = await pickedImage!.readAsBytes();
      // Encode image bytes to base64
      String base64Image = base64Encode(imageBytes);
      //print(base64Image);
      //'http://127.0.0.1:3000/'

      String url = 'http://10.0.2.2:3000/';
      http.Response response = await http.post(
          Uri.parse(url),
        body: {
          'image': base64Image,
        }
      );

      if (response.statusCode == 200) {
        // Handle success
        setState(() {
          diagnosisResult = response.body;
          print(diagnosisResult);
        });
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
        setState(() {
          diagnosisResult = 'Failed to diagnose pneomothorax';
        });
      }
    }
    catch (e) {
      print('Error diagnosing pneomothorax: $e');
      setState(() {
        diagnosisResult = 'Error diagnosing pneomothorax';
      });
    }
  }
}