import 'package:flutter/material.dart';
import 'package:motofixv11/home_appbar.dart';
import 'package:motofixv11/screens/login_regsiter_page.dart';
import 'package:motofixv11/widget/button.dart';
import 'package:motofixv11/widget/button2.dart';
import 'package:motofixv11/widget/google_nav.dart';
import 'package:motofixv11/screens/msages.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 32),
      body: Column(children: [
        HomeAppBar(
            icon: Icon(
          Icons.notifications,
          color: Colors.white,
        )),
        ButtonMenu(
            titleText: 'My Balance', subTitle: '123123\$', taptap: () {}),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          margin: EdgeInsets.only(
              right: size.width * 0.08,
              left: size.width * 0.08,
              bottom: size.height * 0.023),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Icon(Icons.search),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(width: 18),
              ),
              Expanded(
                  flex: 8,
                  child: TextField(
                    // textAlign: TextAlign.left,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Search for garage.',
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      border: InputBorder.none,
                      // filled: true,
                      // contentPadding: EdgeInsets.only(bottom: size.height * 0.016),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 2,
                  )),
              Container(
                child: Icon(
                  Icons.qr_code_scanner,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text('Features',
                            style: TextStyle(
                              color: Colors.blue,
                            )),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),

                          // padding: EdgeInsets.all(6),
                          width: 60,
                          height: 60,
                          child: OutlinedButton(
                          onPressed: () {
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                          builder: (context) => GoogleNav(), // Navigate to the home page
                          ),
                          );
                          },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  // width: size.width * 0.06,
                                  child: Icon(Icons.map, color: Colors.blue,),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Map',
                                  style: TextStyle(fontSize: 10, color: Colors.blue,),
                                )
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),

                          // padding: EdgeInsets.all(6),
                          width: 60,
                          height: 60,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  // width: size.width * 0.06,
                                  child: Icon(Icons.wallet, color: Colors.blue,),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Wallet',
                                  style: TextStyle(fontSize: 10, color: Colors.blue,),
                                )
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          // padding: EdgeInsets.all(6),
                          width: 60,
                          height: 60,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  // width: size.width * 0.06,
                                  child: Icon(Icons.bolt, color: Colors.blue,),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Express service',
                                  style: TextStyle(fontSize: 10, color: Colors.blue,),
                                )
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 7),

                            // padding: EdgeInsets.all(6),
                            width: 60,
                            height: 60,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    // width: size.width * 0.06,
                                    child: Icon(Icons.mail, color: Colors.blue,),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Help Center',
                                    style: TextStyle(fontSize: 10, color: Colors.blue,),
                                  )
                                ],
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 7),

                            // padding: EdgeInsets.all(6),
                            width: 60,
                            height: 60,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    // width: size.width * 0.06,
                                    child: Icon(Icons.phone, color: Colors.blue,),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Calling',
                                    style: TextStyle(fontSize: 10, color: Colors.blue,),
                                  )
                                ],
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 7),
                            // padding: EdgeInsets.all(6),
                            width: 60,
                            height: 60,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    // width: size.width * 0.06,
                                    child: Icon(Icons.other_houses, color: Colors.blue,),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Other',
                                    style: TextStyle(fontSize: 10, color: Colors.blue,),
                                  )
                                ],
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text('Services and Product'),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ButtonMenu2(
                              icon: Icon(Icons.account_box,color: Colors.blue),
                              titleText: 'Oil change service.',
                              subTitle: "Price: 60.000đ",
                              taptap: () {}),
                          ButtonMenu2(
                              icon: Icon(Icons.account_box,color: Colors.blue),
                              titleText: 'Tire repair service',
                              subTitle: 'Price: 50.000đ',
                              taptap: () {}),
                          ButtonMenu2(
                              icon: Icon(Icons.account_box,color: Colors.blue),
                              titleText: 'Vehicle repair service',
                              subTitle: 'Price: 30.000đ - 90.000đ',
                              taptap: () {}),
                          ButtonMenu2(
                              icon: Icon(Icons.account_box,color: Colors.blue,),
                              titleText: 'Car maintenance',
                              subTitle: 'Price: 30.000đ - 150.000đ',
                              taptap: () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              width: double.infinity,
              height: size.height * 0.66,
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
        ),
        BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home, color: Colors.blue),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.list_alt, color: Colors.blue),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessagesScreen(), // Navigate to the home page
                    ),
                  );
                },
                icon: Icon(Icons.message, color: Colors.blue),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(), // Navigate to the home page
                    ),
                  );
                },
                icon: Icon(Icons.person_outlined),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
