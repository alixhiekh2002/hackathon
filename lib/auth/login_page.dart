// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodiegala/auth/sign_up_screen.dart';
import 'package:foodiegala/components/bottom_nav.dart';
import 'package:foodiegala/components/main_button.dart';
import 'package:foodiegala/utils/utilities.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final _auth = FirebaseAuth.instance;
  void login() {
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      Utils().toastedMessage("User Approved");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BottomNavv(),
        ),
      );
    }).onError((error, stackTrace) {
      Utils().toastedMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/mainImages/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Column(
              children: [
                Image(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/mainImages/logo.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Deliever Favourite Food",
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xff1D102D),
                  ),
                  child: Column(
                    children: [
                      Text("Login"),
                      Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            //Email Field
                            Container(
                              margin: EdgeInsets.only(
                                top: 20,
                                right: 20,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                  )),
                              child: TextFormField(
                                controller: emailController,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  contentPadding: EdgeInsets.only(
                                      left: 20, top: 15, bottom: 15),
                                  hintText: "example@gmail.com",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Email";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            //PAssword Field
                            Container(
                              margin: EdgeInsets.only(
                                top: 20,
                                right: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              child: TextFormField(
                                // validator: widget.validator(),
                                obscureText: isPasswordVisible,
                                controller: passwordController,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: togglePassword(),
                                  prefixIcon: Icon(Icons.password),
                                  contentPadding: EdgeInsets.only(
                                      left: 20, top: 15, bottom: 15),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Password";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 34,
                      ),
                      MostButton(
                        text: "Login",
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            login();
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Image(
                              image: AssetImage(
                                "assets/icons/gdg.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image(
                              image: AssetImage("assets/icons/fb.png"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Dont Have An Account?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SignUp(),
                        ),
                      );
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          isPasswordVisible = !isPasswordVisible;
        });
      },
      icon: isPasswordVisible
          ? Icon(Icons.visibility_off)
          : Icon(Icons.visibility),
    );
  }
}
