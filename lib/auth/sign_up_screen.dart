// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodiegala/auth/login_page.dart';
import 'package:foodiegala/components/main_button.dart';
import 'package:foodiegala/utils/utilities.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  void signUp() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastedMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SingleChildScrollView(
            child: Container(
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
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
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
                              //Username
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
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    contentPadding: EdgeInsets.only(
                                        left: 20, top: 15, bottom: 15),
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter Email";
                                    }
                                    return null;
                                  },
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
                                ),
                              ),

                              //Password Field
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter Password";
                                    }
                                    return null;
                                  },
                                  controller: passwordController,
                                  obscureText: isPasswordVisible,
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
                          isLoading: loading,
                          text: "Create Account",
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              signUp();
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Already Have An Account?",
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
                            builder: (_) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                ],
              ),
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
