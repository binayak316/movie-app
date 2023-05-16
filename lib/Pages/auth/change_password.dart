import 'package:flutter/material.dart';

import '../../widgets/circular_elevated_button.dart';
import '../../widgets/primary_text_form_field.dart';
import 'login.dart';

import 'package:firebase_auth/firebase_auth.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final formkey = GlobalKey<FormState>();

  var password1 = " ";
  var password2 = "";

  final password1Controller = TextEditingController();
  final password2Controller = TextEditingController();

//need to know current user to change the pw
//and this gives the currentuser
  final currentUser = FirebaseAuth.instance.currentUser;
  changePassword() async {
    if (password1 == password2) {
      await currentUser!.updatePassword(password2);
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyLogin(),
          ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Your password has been changed login again ",
          style: TextStyle(fontSize: 15),
        ),
      ));
    } else {
      print("Password and confrim password doesn't match");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          "Password and confrim password doesn't match",
          style: TextStyle(fontSize: 16),
        ),
      ));
    }
  }

  bool passToggle = true;
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                        child: Text('Make sure you will remember'),
                      ),
                      PrimaryTextFormField(
                        controller: password1Controller,
                        obscureText: isHidden == true ? true : false,
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock, color: Colors.orange[700]),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else if (password1Controller.text.length < 6) {
                            return "Password should not be less than 6 characters";
                          }
                          return null;
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          child: isHidden == true
                              ? Icon(
                                  Icons.visibility,
                                  color: Colors.orange[700],
                                )
                              : Icon(Icons.visibility_off,
                                  color: Colors.orange[700]),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PrimaryTextFormField(
                        controller: password2Controller,
                        obscureText: passToggle == true ? true : false,
                        hintText: 'Confirm Password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else if (password2Controller.text.length < 6) {
                            return "Password should not be less than 6 charachters";
                          }
                          return null;
                        },
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.orange[700],
                        ),
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
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            // width: 100,
                            child: Circularr_elevated_button(
                                btnName: 'Change Password',
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    setState(() {
                                      password1 = password1Controller.text;
                                      password2 = password2Controller.text;
                                    });
                                    changePassword();

                                    print('validated');
                                  } else {
                                    print('notvalidated');
                                  }
                                }),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
