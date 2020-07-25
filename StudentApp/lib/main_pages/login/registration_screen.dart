import 'package:StudentApp/Services/auth.dart';
import 'package:StudentApp/components/constants.dart';
import 'package:StudentApp/components/roundedButton.dart';
import 'package:flutter/material.dart';

import 'TextInput.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = AuthService();
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String errorMsg = '';
  String stallName = '';
  bool isLoading = false;
  String dropdownvalue = "Deck";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: isLoading
            ? Center(
                child: Container(
                    height: 400,
                    width: 200,
                    child: Dialog(
                      child: CircularProgressIndicator(),
                    )))
            : SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          height: height * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Grab N' Go",
                                style: TextStyle(
                                    fontSize: 34,
                                    color: Color.fromRGBO(48, 47, 86, 100)),
                              ),
                              Text("Students",
                                  style: TextStyle(
                                      fontSize: 28, fontFamily: "Montserrat"))
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(164, 200, 242, 100),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                )),
                            height: height * 0.7,
                            child: Column(children: [
                              SizedBox(
                                height: 48,
                              ),
                              TextInput(
                                field: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                  decoration: kTextFieldDecoration.copyWith(
                                    hintText: 'Enter Your Email',
                                  ),
                                ),
                                icon: Icon(
                                  Icons.mail_outline,
                                  size: 30,
                                ),
                                height: height,
                                width: width,
                              ),
                              SizedBox(height: 15),
                              TextInput(
                                field: TextFormField(
                                  obscureText: true,
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                  decoration: kTextFieldDecoration.copyWith(
                                    hintText: 'Enter Your Password',
                                  ),
                                ),
                                icon: Icon(
                                  Icons.lock_outline,
                                  size: 30,
                                ),
                                height: height,
                                width: width,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    errorMsg.toString(),
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14),
                                  ),
                                ),
                              ),
                              RoundedButton(
                                color: Color.fromRGBO(51, 31, 121, 64.86),
                                title: 'Register',
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  dynamic result = await _auth.registerUser(
                                    email,
                                    password,
                                  );
                                  if (result == null) {
                                    setState(() {
                                      isLoading = false;
                                      errorMsg =
                                          'Please enter a valid email or password';
                                    });
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.of(context)
                                        .pushReplacementNamed(LoginScreen.id);
                                  }
                                },
                              ),
                            ]))
                      ]),
                ),
              ));
  }
}
