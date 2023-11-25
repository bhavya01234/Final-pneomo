import 'package:flutter/material.dart';
import 'package:projects/water/feedback.dart';
import 'package:projects/water/home_screen.dart';
import 'package:projects/water/settings.dart';
import 'package:projects/water/signin.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Bhavya",
              style: TextStyle(
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            accountEmail: Text(
              "example123@gmail.com",
              style: TextStyle(
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/sea.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () {

              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
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
            leading: Icon(Icons.exit_to_app),
            title: Text('About Us'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => buildAboutUs()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
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
    appBar: AppBar(
      title: Text('About Us'),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(16.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Our Team',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height:17),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: buildPerson(
                  'Bhavya Malik',
                  'Flutter App Developer',
                  'assets/sea.jpg',
                ),
              ),
              Flexible(
                child: buildPerson(
                  'Madhura Jituri',
                  'ML model designer',
                  'assets/sea.jpg',
                ),
              ),
              Flexible(
                child: buildPerson(
                  'Samar',
                  'Image Processing + Deployment',
                  'assets/sea.jpg',
                ),
              ),
            ],
          ),

          SizedBox(height: 30),
          Text(
            'Mentor',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          buildPerson(
            'Tarun Aggarwal',
            'ECE Department faculty',
            'assets/sea.jpg',
          ),
          SizedBox(height: 30),
          Text(
            'About the App\n',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Our Skin Cancer Detection App is designed to '
                'help users assess the risk of skin cancer by '
                'analyzing images of skin lesions. Please note that this app '
                'is not a substitute for professional medical advice. '
                'Always consult a healthcare professional for a definitive diagnosis.',
          ),
        ],
      ),
    ),
  );
}

Widget buildPerson(String name, String description, String imageAsset) {
  return Column(
    children: [
      Image.asset(
        imageAsset,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      SizedBox(height: 10),
      Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(description),
    ],
  );
}