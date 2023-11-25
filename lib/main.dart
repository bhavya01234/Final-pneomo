import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:projects/water/signin.dart';
 import 'package:firebase_core/firebase_core.dart';
 import 'package:firebase_ui_auth/firebase_ui_auth.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{


  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const SignInScreen__(),
    );
  }
}
 // class ApplicationState extends ChangeNotifier {
 //   ApplicationState() {
 //     init();
 //   }
 //
 //   Future<void> init() async {
 //     await Firebase.initializeApp();
 //     FirebaseAuth.instance.userChanges().listen((user) {
 //       if (user != null) {
 //         _loggedIn = true;
 //       } else {
 //         _loggedIn = false;
 //       }
 //       notifyListeners();
 //     });
 //   }
 //   bool _loggedIn = false;
 //   bool get loggedIn => _loggedIn;
 //
 //   String? _email;
 //   String? get email => _email;
 //
 //   void startLoginFlow(){
 //     _loggedIn = user.emailAddress;
 //     notifyListeners();
 //   }
 // }