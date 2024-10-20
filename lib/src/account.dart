import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodiegala/auth/login_page.dart';
import 'package:foodiegala/utils/utilities.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                'assets/images/best.jpeg',
              ), // Add your profile image here
            ),
            SizedBox(height: 20),
            // User Name
            Text(
              'Muhammad Ali',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Bio
            SizedBox(height: 20),
            // Stats Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildStatColumn("Orders", "3"),
                buildStatColumn("Past Buying", "30"),
                buildStatColumn("Rating", "4.6"),
              ],
            ),
            SizedBox(height: 20),
            // Settings and Logout Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  buildProfileButton(context, Icons.logout, "Logout"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build Stat Column
  Column buildStatColumn(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  // Build Button
  Widget buildProfileButton(BuildContext context, IconData icon, String label) {
    return MaterialButton(
      onPressed: () {
        auth.signOut().then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LoginPage(),
            ),
          );
        }).onError((error, stackTrace) {
          Utils().toastedMessage(error.toString());
        });
      },
      color: Colors.blue,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}
