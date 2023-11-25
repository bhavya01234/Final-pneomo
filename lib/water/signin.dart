//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// //import 'package:projects/reusable_widget/reusable_widget.dart';
// import 'package:projects/utils/color_utils.dart';
// import 'package:projects/water/forgotpassword.dart';
// import 'package:projects/water/home_screen.dart';
// import 'package:projects/water/signup.dart';
//
// class SignInScreen__ extends StatefulWidget {
//   const SignInScreen__({super.key});
//
//   @override
//   State<SignInScreen__> createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen__> {
//   String email = "", password = "";
//
//   final _formkey = GlobalKey<FormState>();
//
//   TextEditingController useremailcontroller = new TextEditingController();
//   TextEditingController userpasswordcontroller = new TextEditingController();
//
//    userLogin(BuildContext context) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       // if (context != null) {
//       //         Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
//       //       }
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
//     }
//     on FirebaseAuthException catch (e) {
//       // print(" authentication error  : ${e.message}");
//       if (e.code == 'user-not-found') {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(
//             "No User Found for that Email",
//             style: TextStyle(fontSize: 18.0, color: Colors.black),
//           ),
//         ));
//       } else if (e.code == 'wrong-password') {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text(
//               "Wrong Password Provided by User",
//               style: TextStyle(fontSize: 18.0, color: Colors.black),
//             )));
//       }
//     }
//   }
//   // userLogin(BuildContext context) async {
//   //   try {
//   //     await FirebaseAuth.instance.signInWithEmailAndPassword(
//   //       email: email,
//   //       password: password,
//   //     );
//   //
//   //     // Check if the context is still valid before navigating
//   //     if (context != null) {
//   //       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
//   //     }
//   //   } on FirebaseAuthException catch (e) {
//   //     // ... (remaining code)
//   //   }
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           "Pneumo Tech",
//           textAlign: TextAlign.right,
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.white70,
//             fontFamily: 'YoungSerif',
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 hexStringToColor("074548"),
//                 hexStringToColor("bb6162"),
//                 hexStringToColor("87a48d"),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             )),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//               Image(
//                 image: AssetImage("assets/lungs.png"),
//                 width: 290,
//                 height: 270,
//               ),
//               // logoWidget(
//               //     "assets/lungs.png",
//               //
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.only(left: 20.0),
//               //   child: Text(
//               //     "Welcome\nBack",
//               //     style: TextStyle(
//               //         color: Colors.white,
//               //         fontSize: 34.0,
//               //         fontFamily: 'Pacifico'),
//               //   ),
//               // ),
//               SizedBox(
//                 height: 30.0,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 6.0),
//                 margin: EdgeInsets.symmetric(horizontal: 20.0),
//                 decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.3),
//                     borderRadius: BorderRadius.circular(30)),
//                 child: TextFormField(
//                   controller: useremailcontroller,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter E-Mail';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       prefixIcon: Icon(
//                         Icons.email,
//                         color: Colors.white,
//                       ),
//                       hintText: 'Your Email',
//                       hintStyle: TextStyle(color: Colors.white.withOpacity(0.9))),
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 6.0),
//                 margin: EdgeInsets.symmetric(horizontal: 20.0),
//                 decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.3),
//                     borderRadius: BorderRadius.circular(30)),
//                 child: TextFormField(
//                   controller: userpasswordcontroller,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter Password';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       prefixIcon: Icon(
//                         Icons.password,
//                         color: Colors.white,
//                       ),
//                       hintText: 'Password',
//                       hintStyle: TextStyle(color: Colors.white.withOpacity(0.9))),
//                   style: TextStyle(color: Colors.white),
//                   obscureText: true,
//                 ),
//               ),
//               SizedBox(
//                 height: 15.0,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => ForgotPassword()));
//                 },
//                 child: Container(
//                   padding: EdgeInsets.only(right: 24.0),
//                   alignment: Alignment.bottomRight,
//                   child: Text(
//                     "Forgot password?",
//                     style: TextStyle(color: Colors.white, fontSize: 18.0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 28.0,
//               ),
//               GestureDetector(
//                 /*onTap: () {
//   if (_formkey.currentState!.validate()) {
//     setState(() {
//       email = useremailcontroller.text;
//       password = userpasswordcontroller.text;
//     });
//   }
//   userLogin(context);
// },
// */
//                 onTap: () {
//
//                   if (_formkey.currentState!.validate()) {
//                     setState(() {
//                       email = useremailcontroller.text;
//                       password = userpasswordcontroller.text;
//                     });
//                   }
//                   print("hello helloooooo");
//                   userLogin(context);
//                   //debugPrint("Email: $email, Password: $password");
//                   // Future.delayed(Duration(milliseconds: 100)).then((_) {
//                   //   userLogin(context);
//                   // });
//                 },
//                 child: Center(
//                   child: Container(
//                     width: 150,
//                     height: 55,
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                         color: Colors.deepOrangeAccent,
//                         borderRadius: BorderRadius.circular(30)),
//                     child: Center(
//                         child: Text(
//                           "Login",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold),
//                         )),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 23.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "New User?",
//                     style: TextStyle(color: Colors.white, fontSize: 20.0),
//                   ),
//                   SizedBox(
//                     width: 5.0,
//                   ),
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => SignUpScreen()));
//                       },
//                       child: Text(
//                         " Signup",
//                         style: TextStyle(
//                             color: Colors.deepOrange,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold),
//                       ))
//                 ],
//               ),
//               SizedBox(
//                 height: 30.0,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projects/reusable_widget/reusable_widget.dart';
import 'package:projects/utils/color_utils.dart';
import 'package:projects/water/forgotpassword.dart';
import 'package:projects/water/signup.dart';
import 'home_screen.dart';
class SignInScreen__ extends StatefulWidget {
  const SignInScreen__({super.key});

  @override
  State<SignInScreen__> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen__> {
  TextEditingController _passwordTextController =TextEditingController();
  TextEditingController _emailTextController =TextEditingController();
  bool _passwordVisible= false;

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Login was successful, navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (e) {
      print('Login failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password wrong: $e'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true, appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
        "Pneumo Tech",
        textAlign: TextAlign.right,
        style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white70,
        fontFamily: 'YoungSerif',
    ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          hexStringToColor("074548"),
          hexStringToColor("bb6162"),
          hexStringToColor("87a48d"),

        ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Image(
                    image: AssetImage(
                    "assets/lungs.png"),
                  width: 300,
                  height: 310,
                ),
                SizedBox(
                  height: 0,
                ),
                reusableTextField("Email Address", Icons.email_outlined, false, _emailTextController),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: reusableTextField(
                              "Password", Icons.lock_outline_rounded, _passwordVisible, _passwordTextController),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                },
                child: Container(
                  padding: EdgeInsets.only(right: 24.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () {
                  loginWithEmailAndPassword(_emailTextController.text, _passwordTextController.text);
                }),
                signupOption()
              ],
            ),
          ),
        ),
      ),
    );
  }


  Row signupOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black,fontSize: 17.0)),

        GestureDetector(
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
          } ,
          child: const Text(" Sign Up",
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                fontSize: 17.0),
          ),
        )
      ],
    );
  }
  @override
  void dispose() {
    _passwordTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }
}
//hello i will be pushed