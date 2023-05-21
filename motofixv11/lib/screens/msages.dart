import 'package:flutter/material.dart';
import 'package:motofixv11/homepage.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Messages'),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'MotoFix'), // Navigate to the home page
                ),
              );
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search messages',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with the actual number of chats
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('User ${index + 1}', style: TextStyle(color: Colors.blue)),
                    backgroundColor: Colors.white,
                  ),
                  title: Text('User ${index + 1}', style: TextStyle(color: Colors.blue)),
                  subtitle: Text('Last message', style: TextStyle(color: Colors.blue)),
                  onTap: () {
                    // Open chat with user
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
