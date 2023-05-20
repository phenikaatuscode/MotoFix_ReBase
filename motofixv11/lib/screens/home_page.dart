import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motofixv11/controller/auth.dart';
import 'package:motofixv11/widget/widget_googlemap.dart';
import 'package:motofixv11/widget/googlemap_test.dart';
import 'package:motofixv11/screens/login_regsiter_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> _showLogoutConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () async {
                await Auth().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(), // Navigate to the login screen
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _userAvatar(BuildContext context) {
    return Positioned(
      top: 16,
      right: 16,
      child: GestureDetector(
        onTap: () => _showLogoutConfirmation(context), // Show logout confirmation dialog
        child: CircleAvatar(
          child: Icon(Icons.person, color: Colors.white),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          prefixIcon: Icon(Icons.search, color: Colors.white),
        ),
      ),
    );
  }

  Widget _featureIcons(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapScreen(), // Navigate to MapScreen widget
                ),
              );
            },
            child: Column(
              children: <Widget>[
                Icon(Icons.calendar_today, color: Colors.white),
                const SizedBox(height: 8),
                Text('Book Appointment', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Icon(Icons.history, color: Colors.white),
              const SizedBox(height: 8),
              Text('Repair History', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.search, color: Colors.white),
              const SizedBox(height: 8),
              Text('Find Mechanics', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMapWidget(),
          _userAvatar(context),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 40),
                _searchBar(),
                const SizedBox(height: 20),
                Expanded(child: SizedBox()),
                _featureIcons(context),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
