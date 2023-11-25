import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:projects/utils/color_utils.dart';
import 'package:projects/utils/selectImage_utils.dart';
import 'package:projects/water/mainmenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Uint8List? _image;

  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState((){
      _image=img;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true, appBar: AppBar(
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

      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "SAMPLE DESK",
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    ),

      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("074548"),
            hexStringToColor("bb6162"),
            hexStringToColor("87a48d"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter
          ),
        ),

        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 120,
              ),
              Text(
                "Add X-RAY : ",
                textAlign: TextAlign.right,
                style:
                TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.greenAccent.shade200,
                  //fontFamily: '',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [

                  _image != null?
                      CircleAvatar(
                        radius: 65,
                        backgroundImage: MemoryImage(_image!),
                      )
                  :
                  const CircleAvatar(
                    radius: 65 ,
                    backgroundImage: NetworkImage('https://www.tgsin.in/images/joomlart/demo/default.jpg'),
                  ),
                  Positioned(
                      child:
                      IconButton(
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    bottom: -10,
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              Text(
                "Upload here",
                textAlign: TextAlign.right,
                style:
                TextStyle(
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              //Image(image: AssetImage("assets/lungs.png")),
              const SizedBox(
                height: 70,
              ),
              IconButton(
                onPressed: (){
                  FirebaseAuth.instance.signOut().then((value) {
                    print("signed out");
                    Navigator.push(context,
                        MaterialPageRoute (builder: (context) => SignInScreen()));
                  });
                },
                icon: Icon(Icons.exit_to_app),
                iconSize: 50,
                color: Colors.black87,
                //alignment:Alignment.bottomLeft,
              ),
            ],
          ),
      //   child: ElevatedButton(
      //     child: Text(
      //     //TextAlign
      //       "LogOut",
      //   ),
      //   onPressed: (){
      //     Navigator.push(context,
      //         MaterialPageRoute (builder: (context) => HomeScreen()));
      //   },
      // ),
      ),
    );
  }
}
