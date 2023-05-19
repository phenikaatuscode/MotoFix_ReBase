import 'package:flutter/material.dart';

class ChooseTypeUser extends StatefulWidget {
  @override
  _ChooseTypeUserState createState() => _ChooseTypeUserState();
}

class _ChooseTypeUserState extends State<ChooseTypeUser> {
  bool isButton1Selected = false;
  bool isButton2Selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/picture/choosetype_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            'Bạn là...?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 48), // Adjust the width as needed
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isButton1Selected = true;
                                isButton2Selected = false;
                              });
                            },
                            child: Container(
                              width: 170,
                              height: 170,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isButton1Selected ? Colors.orange : Colors.white,
                              ),
                              child: Image.asset(
                                'images/icon/mechanic_icon.png',
                                width: 80,
                                height: 80,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Tôi là thợ sửa chữa',
                            style: TextStyle(
                              color: isButton1Selected ? Colors.white : Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isButton1Selected = false;
                                isButton2Selected = true;
                              });
                            },
                            child: Container(
                              width: 170,
                              height: 170,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isButton2Selected ? Colors.orange : Colors.white,
                              ),
                              child: Image.asset(
                                'images/icon/user_icon.png',
                                width: 80,
                                height: 80,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Tôi là người thuê',
                            style: TextStyle(
                              color: isButton2Selected ? Colors.white : Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
