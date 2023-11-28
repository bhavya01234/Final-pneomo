import 'package:flutter/material.dart';
import 'package:projects/utils/color_utils.dart';
import 'package:projects/water/feedback.dart';
import 'package:projects/water/home_screen.dart';
import 'package:projects/water/settings.dart';
import 'package:projects/water/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightGreen.shade300,
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 21.0, 0.0, 0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "",
              style: TextStyle(
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            accountEmail: Text(
              "",
              style: TextStyle(
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              image:
              DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                    'assets/heal.png',
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {

              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context).overlay;
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.settings),
          //   title: const Text('Settings'),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => SettingsPage()));
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () {
              //Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeedbackPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => buildAboutUs()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app_rounded),
            title: Text('Logout'),
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen__()));
            },
          ),
        ],
      ),
    );
  }
}
Widget buildAboutUs() {
  return Scaffold(

      extendBodyBehindAppBar: true, appBar: AppBar(
    iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
          'About Us',
              style: TextStyle(
          color: Colors.white,
                fontWeight: FontWeight.bold,

      ),
      ),
    ),
    body: Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [
        hexStringToColor("074548"),
        hexStringToColor("bb6162"),
        hexStringToColor("87a48d"),

      ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
      ),),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:58),
            Text(
              'Our Team',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, color: Colors.yellow),
            ),
            SizedBox(height:17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: buildPerson(
                    'Bhavya Malik',
                    'Flutter App Developer',
                    'assets/bhavya_pic.jpeg',
                  ),
                ),
                Flexible(
                  child: buildPerson(
                    'Madhura Jituri',
                    'ML model + Image processing',
                    'assets/madhura_pic.jpeg',
                  ),
                ),
                Flexible(
                  child: buildPerson(
                    'Divya',
                    'Deployment',
                    'assets/divya_pic.jpeg',
                  ),
                ),
              ],
            ),

            SizedBox(height: 14),
            Text(
              'Mentor',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.tealAccent),
            ),
            buildPerson(
              'Dr. Tarun Aggarwal',
              'ECE Department faculty',
              'assets/tarun_sir_pic.jpeg',
            ),
            SizedBox(height: 20),
            Text(
              'About the App\n',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, color: Colors.yellow),
            ),

            Text(
              'PneumoScan, a Flutter app, utilizes advanced'
                  ' ML and image processing to swiftly detect '
                  'pneumothorax from uploaded chest X-rays.'
                  ' Streamlining diagnosis, this user-friendly tool '
                  'enhances healthcare accessibility, providing instant'
                  ' results for efficient medical interventions.',
            ),
          ],
        ),
      ),
    )

  );
}

Widget buildPerson(String name, String description, String imageAsset) {
  return Column(
    children: [
      Image.asset(
        imageAsset,
        width: 100,
        height: 110,
        fit: BoxFit.cover,
      ),
      SizedBox(height: 10),
      Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 17,
          //color: Colors.greenAccent,
        ),
      ),
      Text(description),
    ],
  );
}