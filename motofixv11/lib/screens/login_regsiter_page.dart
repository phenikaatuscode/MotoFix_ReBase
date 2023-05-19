import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motofixv11/auth.dart';
import 'package:motofixv11/screens/chosetype_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'invalid-email' || e.code == 'user-not-found') {
          errorMessage = 'Email không hợp lệ!';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Sai mật khẩu!';
        } else {
      errorMessage = 'Vui lòng nhập Email / Mật khẩu!';
        }
        print(e.code);
      });
    }
  }



  Widget _title() {
    return const Text(
      'MotorFix',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.lightBlue,
      ),
    );
  }

  Widget _logo() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Image.asset(
        'images/picture/logoblue.png',
        height: 200,
        width: 300,
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(color: Colors.lightBlue),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlue),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlue),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : '$errorMessage',
      style: TextStyle(color: Colors.blue, fontSize: 14),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: signInWithEmailAndPassword,
      child: Text('Đăng nhập'),
      style: ElevatedButton.styleFrom(
        primary: Colors.lightBlue,
        textStyle: TextStyle(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

Widget _resignButton() {
  return ElevatedButton(
    onPressed: () {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChooseTypeUser()),
      );
    },
    child: Text('Đăng kí tài khoản'),
    style: ElevatedButton.styleFrom(
      primary: Colors.lightBlue,
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}


 @override
Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    ),
    body: Stack(
      children: [
        Image.asset(
          'images/picture/bG_login.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(0.5),
          colorBlendMode: BlendMode.darken,
        ),
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 70),
                _logo(),
                _entryField('Tài khoản Email', _controllerEmail),
                _entryField('Mật khẩu', _controllerPassword),
                _errorMessage(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: _loginButton()),
                    const SizedBox(width: 10),
                    Expanded(child: _resignButton()),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Bằng cách nhấp vào "Đăng kí tài khoản", bạn đồng ý với các Điều khoản Dịch vụ và Chính sách Bảo mật của chúng tôi.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.lightBlue),
                ),
                const SizedBox(height: 210),
                Text(
                  'MotoFix.vn - Project by Trần Anh Tú, Nguyễn Bá Việt Hoàng, Nguyễn Anh Tú, Nguyễn Quốc Oai',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}