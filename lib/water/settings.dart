// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SettingsPage(),
//     );
//   }
// }
//
// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }
//
// class _SettingsPageState extends State<SettingsPage> {
//   TextEditingController _usernameController = TextEditingController();
//   bool _notificationsEnabled = false;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Username',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               controller: _usernameController,
//               decoration: InputDecoration(
//                 hintText: 'Enter your username',
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Notifications',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Switch(
//               value: _notificationsEnabled,
//               onChanged: (value) {
//                 setState(() {
//                   _notificationsEnabled = value;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // You can add logic here to handle the settings without persistence
//                 // For example, print the values:
//                 print('Username: ${_usernameController.text}');
//                 print('Notifications Enabled: $_notificationsEnabled');
//
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Settings updated!'),
//                   ),
//                 );
//               },
//               child: Text('Save Settings'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects/utils/selectImage_utils.dart';
import 'package:projects/water/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _usernameController = TextEditingController();
  bool _notificationsEnabled = false;
  String _profilePicture = "assets/default_profile_picture.png"; // Add a default profile picture asset

  @override
  void initState() {
    super.initState();
  }

  // Function to handle uploading a new profile picture
  //Future<void> _uploadProfilePicture() async {
    // Implement logic for uploading a new profile picture
    // This could involve using an image picker package or other mechanisms
    // For simplicity, this example just sets a default profile picture
  //   setState(() {
  //     _profilePicture = "assets/default_profile_picture.png";
  //   });
  // }

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
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body:
          Container(
            color: Colors.teal.shade200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Call function to handle uploading a new profile picture
                selectImage();
              },
              child: Container(
                height: MediaQuery.of(context).size.width / 3, // 1/5th of the width
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_profilePicture),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Change Profile Picture',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Username',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Enter your username',
              ),
            ),
            SizedBox(height: 20),
            // Text(
            //   'Notifications',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            // Switch(
            //   value: _notificationsEnabled,
            //   onChanged: (value) {
            //     setState(() {
            //       _notificationsEnabled = value;
            //     });
            //   },
            // ),
            SizedBox(height: 0),
            ElevatedButton(
              onPressed: () {
                // You can add logic here to handle the settings without persistence
                // For example, print the values:
                print('Username: ${_usernameController.text}');
                print('Notifications Enabled: $_notificationsEnabled');

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Settings updated!'),
                  ),
                );
              },
              child: Text('Save Settings'),
            ),
            SizedBox(height: 0),
            ElevatedButton(
              onPressed: () {
                // Implement logic for logging out
                // This could involve clearing user authentication state
                print('Logout');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SignInScreen__(), // Replace with your login screen
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Logged out!'),
                  ),
                );
              },
              child: Text('Logout'),
            ),
            SizedBox(height: 70),
            Icon(Icons.policy),
            SizedBox(height: 7),
            Text('By using our services, you agree to comply with our terms and conditions. '
                'These include respecting user privacy, adhering to '
                'applicable laws, and acknowledging that our content is '
                'protected by intellectual property rights.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
