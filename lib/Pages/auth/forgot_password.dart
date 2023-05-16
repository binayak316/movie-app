import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Pages/auth/register.dart';

import '../../widgets/circular_elevated_button.dart';
import '../../widgets/primary_text_form_field.dart';
import 'login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formkey = GlobalKey<FormState>();

  var email = " ";
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  ChangePassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.greenAccent,
        content: Text(
          "Password reset email has been sent!!",
          style: TextStyle(fontSize: 12),
        ),
      ));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyLogin()),
      );
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text('Forgot Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 230, 8, 0),
          child: Form(
            key: formkey,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5), //apply padding to all four sides
                    child: Text(
                      "Please input your email to reset the password",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PrimaryTextFormField(
                      controller: emailController,
                      hintText: 'example@gmail.com',
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
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.orange[700],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // width: 120,
                        child: Circularr_elevated_button(
                            btnName: 'Send Mail',
                            onPressed: () {
                              print("button is clicked");

                              if (formkey.currentState!.validate()) {
                                setState(() {
                                  email = emailController.text;
                                });
                                ChangePassword();
                                print('validated');
                              } else {
                                print('notvalidated');
                              }
                            }),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an Account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, a, b) => Register(),
                                transitionDuration: Duration(seconds: 0),
                              ),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
