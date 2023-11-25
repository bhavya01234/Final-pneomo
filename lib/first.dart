import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

// stless - enter :  (for hot reload)
class Home extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.red.shade200,

      body :
      // Container(
      //   color: Colors.grey,
      //
      // ),
      Center(
        //  The FlatButton , RaisedButton and OutlineButton widgets ...
        //  have been replaced by :
        //  TextButton , ElevatedButton , and OutlinedButton respectively.

        child:

        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.alternate_email),
        //   color: Colors.yellow,
        // ),



        // BELOW FOR normal BUTTON :

        ElevatedButton(
          onPressed: () {
            print('login button clicked');
          }, child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.pink.shade800,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        ),

        // Icon(
        //   Icons.play_circle_outlined,
        //   color: Colors.purple,
        //   size: 70,
        // ),



//         Text('hello ninjas',
//           style:  TextStyle(
//             color: Colors.pink.shade700,
//             fontWeight: FontWeight.bold,
//             fontSize: 40,
//             letterSpacing: 2.0,
// //font family chosen and linked from pubspec.yaml
//             fontFamily: 'YoungSerif',
//           ),),

        // BELOW WORKING CORRECTLYYY !!

        // Image(
        //   //in pubspec.yaml -> can write just 'assets/' to access full folder
        //
        //   image: AssetImage('assets/sea.jpg'),
        // ),

        //BELOW NOT CONNECTING (img from network) (SOCKET ERROR)
        // Image(
        //   image: NetworkImage(
        //   'https://images.unsplash.com/photo-1696247833485-bcd2014cbdb9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2944&q=80'
        //   ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('click '),
        backgroundColor: Colors.grey,
      ),
    );
  }
}

//   BELOW WAS INSIDE CHILD



