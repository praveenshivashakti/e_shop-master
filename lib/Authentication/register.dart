import 'dart:io';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:e_shop/DialogBox/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import '../Store/storehome.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/animation/FadeAnimation.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Register()));

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameTextEditingcontroller =
      TextEditingController();
  final TextEditingController _emailTextEditingcontroller =
      TextEditingController();
  final TextEditingController _passwordTextEditingcontroller =
      TextEditingController();
  final TextEditingController _cPasswordTextEditingcontroller =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userImageUrl = "";
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 400,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: -40,
                      height: 400,
                      width: width * 1,
                      child: FadeAnimation(
                        1,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/canos.png'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ),
                    Positioned(
                      height: 400,
                      width: width + 20,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/background-2.png'),
                                    fit: BoxFit.fill)),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              new Center(
                child: new Container(
                  child: new Material(
                    child: new InkWell(
                      onTap: _selectImage,
                      child: new Container(
                          width: 100.0,
                          height: 100.0,
                          child: new CircleAvatar(
                            radius: _screenWidth = 0.15,
                            backgroundColor: Colors.white,
                            backgroundImage: _imageFile == null
                                ? null
                                : FileImage(_imageFile),
                            child: _imageFile == null
                                ? Icon(
                                    Icons.add_photo_alternate,
                                    size: _screenWidth * 0.15,
                                    color: Colors.grey,
                                  )
                                : null,
                          )),
                    ),
                    color: Colors.transparent,
                  ),
                  color: Colors.orange,
                ),
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                        onTap: _selectImage,
                        child: CircleAvatar(
                          radius: _screenWidth = 0.15,
                          backgroundColor: Colors.purple,
                          backgroundImage:
                              _imageFile == null ? null : FileImage(_imageFile),
                          child: _imageFile == null
                              ? Icon(
                                  Icons.add_photo_alternate,
                                  size: _screenWidth * 0.15,
                                  color: Colors.grey,
                                )
                              : null,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1.5,
                        Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1.7,
                        Form(
                          key: _formKey,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.purple[50],
                                  blurRadius: 25.0, // soften the shadow
                                  spreadRadius: 5.0, //extend the shadow
                                  offset: Offset(
                                    10.0, // Move to right 10  horizontally
                                    1.0, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                CustomTextField(
                                    controller: _nameTextEditingcontroller,
                                    data: Icons.person,
                                    hintText: "Name",
                                    isObsecure: false),
                                CustomTextField(
                                    controller: _emailTextEditingcontroller,
                                    data: Icons.person,
                                    hintText: "Email",
                                    isObsecure: false),
                                CustomTextField(
                                    controller: _passwordTextEditingcontroller,
                                    data: Icons.person,
                                    hintText: "password",
                                    isObsecure: true),
                                CustomTextField(
                                    controller: _cPasswordTextEditingcontroller,
                                    data: Icons.person,
                                    hintText: "Confirm password",
                                    isObsecure: true),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1.9,
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: _uploadAndSave,
                              color: Colors.purple[200],
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        2,
                        Center(
                            child: Text(
                          "Create Account",
                        ))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectImage() async {
    _imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  Future<void> _uploadAndSave() async {
    if (_imageFile == null) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
                message: "please selecte profile image before continue");
          });
    } else {
      _passwordTextEditingcontroller.text ==
              _cPasswordTextEditingcontroller.text
          ? _emailTextEditingcontroller.text.isNotEmpty &&
                  _passwordTextEditingcontroller.text.isEmpty &&
                  _cPasswordTextEditingcontroller.text.isNotEmpty &&
                  _nameTextEditingcontroller.text.isNotEmpty
              ? uploadToStorage()
              : displayDialog("please fill up the small form")
          : displayDialog("password do not match");
    }
  }

  displayDialog(String msg) {
    showDialog(
        context: context,
        builder: (c) {
          return ErrorAlertDialog(message: msg);
        });
  }

  uploadToStorage() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingAlertDialog(
              message: "Authenticating Cano online Water supply");
        });
    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child(imageFileName);
    StorageUploadTask storageUploadTask = storageReference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
    await taskSnapshot.ref
        .getDownloadURL()
        .then((urlImage) => userImageUrl = urlImage);
    _registerUser();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void _registerUser() async {
    FirebaseUser firebaseUser;
    await _auth
        .createUserWithEmailAndPassword(
      email: _emailTextEditingcontroller.text.trim(),
      password: _passwordTextEditingcontroller.text.trim(),
    )
        .then((auth) {
      firebaseUser = auth.user;
    }).catchError(
      (error) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          },
        );
      },
    );
  }
}
