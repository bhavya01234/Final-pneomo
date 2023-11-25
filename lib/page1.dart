//import 'dart:html';

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
      backgroundColor: Colors.amber,

      body:
      // for MULTIPLE widgets : ROW :
      Column(
        //mainAxisAlignment: MainAxisAlignment.center ,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        //mainAxisAlignment: MainAxisAlignment.start ,
        //mainAxisAlignment: MainAxisAlignment.center ,
        //crossAxisAlignment: CrossAxisAlignment.stretch ,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/sea.jpg'),
            radius: 30.0,
          ),
          Divider(
            height:60,
            color: Colors.grey,
          ),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: <Widget>[
              Text('hello'),
              Text('world'),
              Text('suppp'),
            ],
          ),
          //ADD SPACE OF in the form of box : SizedBox
          SizedBox(height: 40,),
          Text('widget 1 - text'),
          ElevatedButton(
            onPressed: () {},

            child: Text('click here'),
            style:
            ElevatedButton.styleFrom(
              primary: Colors.blueGrey.shade800,
            ),
          ),
          Expanded(
            flex: 3,
              child:
              Container(
                color: Colors.lime,
                padding: EdgeInsets.all(40.0),
                child:
                Text('in container-> child-> text',
                  style:
                  TextStyle(
                    color: Colors.cyan.shade700,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
          ),
          Expanded(
            flex: 1,
            child:
            Container(

              color: Colors.pinkAccent,
              padding: EdgeInsets.all(40.0),
              child:
              Text('in container-> child-> text',
                style:
                TextStyle(
                  color: Colors.cyan.shade700,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),),
            ),
          ),
        ],
      ),

        // // for MULTIPLE widgets : ROW :
        //   Row(
        //     //mainAxisAlignment: MainAxisAlignment.center ,
        //     //mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        //     //mainAxisAlignment: MainAxisAlignment.end ,
        //     mainAxisAlignment: MainAxisAlignment.center ,
        //     crossAxisAlignment: CrossAxisAlignment.stretch ,
        //     //crossAxisAlignment: CrossAxisAlignment.end,
        //     children: <Widget>[
        //       Text('widget 1 - text'),
        //       ElevatedButton(
        //         onPressed: () {},
        //
        //         child: Text('click here'),
        //         style:
        //         ElevatedButton.styleFrom(
        //           primary: Colors.blueGrey.shade800,
        //         ),
        //       ),
        //       Container(
        //         color: Colors.lime,
        //         padding: EdgeInsets.all(40.0),
        //         child:
        //         Text('in container-> child-> text',
        //         style:
        //           TextStyle(
        //             color: Colors.cyan.shade700,
        //             fontSize: 15,
        //             fontWeight: FontWeight.bold,
        //           ),),
        //       )
        //     ],
        //   ),


        // Padding(
        //   //cant apply margin or colour here
        //   padding: EdgeInsets.all(50.0),
        //   child: Text('hello world',
        //   style: TextStyle(
        //     fontSize: 30,
        //   ),),
        //
        // )


        //BELOW : WITH CONTAINER

      // Container(
      //   // padding: EdgeInsets.all(40.0),
      //   // padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 30.0),
      //   // padding: EdgeInsets.fromLTRB(20.0, 10.0, 70.0, 50.0),
      //   //  ( padding: EdgeInsets.fromLTRB(left, top, right, bottom) )
      //   margin:EdgeInsets.fromLTRB(10.0, 70.0, 30.0, 50.0),
      //   color: Colors.green,
      //
      //   child:
      //   Text('hello'),
      //
      // )

    );
  }
}
