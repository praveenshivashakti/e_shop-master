import 'package:e_shop/Admin/adminLogin.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:e_shop/DialogBox/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Store/storehome.dart';
import 'package:e_shop/Config/config.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                child: Image(
                  image: AssetImage("images/login.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             children: <Widget>[
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text("Login"),
//                 ],
//               ),
//               Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('assets/Illustration.png'))))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
