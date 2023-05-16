import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Pages/auth/register.dart';

import '../../widgets/circular_elevated_button.dart';
import '../../widgets/primary_text_form_field.dart';
import '../home.dart';
import 'forgot_password.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final formkey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  // making variabls (input which user puts that is saved into these variables)
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  //clean up the controller when the widget is disposed
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool passToggle = true;
  // bool emailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 120, 10, 0),
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 230, 227, 227),
                                blurRadius: 1.0),
                          ],
                          image: DecorationImage(
                            image: AssetImage('assets/logo.png'),
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ), //upper image part ends
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                      child: Form(
                        key: formkey,
                        //eha form use garne
                        child: Column(
                          children: [
                            PrimaryTextFormField(
                              controller: emailController,
                              hintText: "example@gmail.com",
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.orange[700],
                              ),
                              validator: (value) {
                                bool emailValid =
                                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value!);
                                if (value.isEmpty) {
                                  return "Enter email address";
                                } else if (!emailValid) {
                                  return "Enter valid emaill address";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            PrimaryTextFormField(
                              controller: passwordController,
                              obscureText: passToggle == true ? true : false,
                              hintText: '******',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                } else if (passwordController.text.length < 6) {
                                  return "Password should not be less than 6 charachters";
                                }
                                return null;
                              },
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.orange[700]),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    passToggle = !passToggle;
                                  });
                                },
                                child: passToggle == true
                                    ? Icon(
                                        Icons.visibility,
                                        color: Colors.orange[700],
                                      )
                                    : Icon(Icons.visibility_off,
                                        color: Colors.orange[700]),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, a, b) =>
                                              ForgotPassword(),
                                          transitionDuration:
                                              Duration(seconds: 0),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Forgot Password ?",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Circularr_elevated_button(
                                      btnName: 'Login',
                                      onPressed: () {
                                        if (formkey.currentState!.validate()) {
                                          setState(() {
                                            email = emailController.text;
                                            password = passwordController.text;
                                          });
                                          userLogin();

                                          print('validated');
                                        } else {
                                          print('notvalidated');
                                        }
                                      }),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10.0, 19, 10, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account yet?"),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Register()),
                                      );
                                    },
                                    child: Text(
                                      "Create New",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // this userLogin is a function and this function is a method
  //which is written below after forgot password line and here it is calling
  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.greenAccent,
        content: Text(
          "Successfully logged in",
          style: TextStyle(fontSize: 15),
        ),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("no user found for that email");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "No user found for that email",
            style: TextStyle(fontSize: 15),
          ),
        ));
      } else if (e.code == "wrong-password") {
        print("Wrong password provided");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Wrong password provided",
            style: TextStyle(fontSize: 15),
          ),
        ));
      }
    }
  }
}
