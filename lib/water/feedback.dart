// // import 'package:flutter/material.dart';
// //
// // class feedbackscreen extends StatefulWidget {
// //   const feedbackscreen({super.key});
// //
// //   @override
// //   State<feedbackscreen> createState() => _feedbackscreenState();
// // }
// //
// // class _feedbackscreenState extends State<feedbackscreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:projects/utils/color_utils.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FeedbackPage(),
//     );
//   }
// }
//
// class FeedbackPage extends StatefulWidget {
//   @override
//   _FeedbackPageState createState() => _FeedbackPageState();
// }
//
// class _FeedbackPageState extends State<FeedbackPage> {
//   TextEditingController _feedbackController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text(
//             'Feedback Page',
//           style:
//           TextStyle(
//             color: Colors.white,
//           ),
//         ),
//
//       ),
//
//       body:
//
//     Container(
//     width: MediaQuery.of(context).size.width,
//     height: MediaQuery.of(context).size.height,
//     decoration: BoxDecoration(
//     gradient: LinearGradient(
//     colors: [
//     hexStringToColor("074548"),
//     hexStringToColor("bb6162"),
//     hexStringToColor("87a48d"),
//     ], begin: Alignment.topCenter, end: Alignment.bottomCenter
//     ),
//     ),
//
//       child: Padding(
//
//         padding: const EdgeInsets.all(16.0),
//
//         child: Column(
//           children: [
//             SizedBox(height: 90),
//             Text(
//               'Please provide your feedback:',
//               style:
//               TextStyle(
//                   fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.tealAccent.shade200,
//
//               ),
//
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _feedbackController,
//               maxLines: 5,
//               decoration: InputDecoration(
//                 hintText: 'Your feedback here...',
//                 border: OutlineInputBorder(
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.black38, // Change the background color here.
//               ),
//               onPressed: () {
//                 String feedback = _feedbackController.text;
//                 // You can handle the feedback data here (e.g., send it to a server).
//                 print('User feedback: $feedback');
//                 _feedbackController.clear(); // Clear the text field after submission.
//               },
//               child: Text(
//                   'Submit Feedback',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _feedbackController.dispose();
//     super.dispose();
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/utils/color_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeedbackPage(),
    );
  }
}

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _feedbackController = TextEditingController();
  final CollectionReference _feedbackCollection =
  FirebaseFirestore.instance.collection('feedback');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Feedback Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 90),
              Text(
                'Please provide your feedback:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.tealAccent.shade200,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Your feedback here...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black38,
                ),
                onPressed: () async {
                  String feedback = _feedbackController.text;
                  if (feedback.isNotEmpty) {
                    await _feedbackCollection.add({'feedback': feedback});
                    print('User feedback saved to Firestore: $feedback');
                    _feedbackController.clear();
                  } else {
                    print('Feedback is empty');
                  }
                },
                child: Text(
                  'Submit Feedback',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}
//
// Color hexStringToColor(String hexString) {
//   return Color(int.parse(hexString, radix: 16) + 0xFF000000);
// }
