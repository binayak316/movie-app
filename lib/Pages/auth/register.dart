import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/circular_elevated_button.dart';
import '../../widgets/primary_text_form_field.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();

  var firstname = "";
  var lastname = "";
  var email = "";
  var phone = "";
  var password1 = "";
  var password2 = "";

  // making textediting controller
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final password1Controller = TextEditingController();
  final password2Controller = TextEditingController();

//dispose method is for release the memory allocation
// when user fill the form and do press a button then the data should be clear that functionality is done by dispose method
  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    password1Controller.dispose();
    password2Controller.dispose();
    super.dispose();
  }

  bool isHidden = true;
  bool passToggle = true;

  String dropdownValue = 'Administration';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 50, 10, 0),
              child: Card(
                elevation: 1,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 230, 227, 227),
                              blurRadius: 1.0),
                        ],
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create your account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: formkey,
                      child: Column(children: [
                        PrimaryTextFormField(
                          controller: firstnameController,
                          hintText: 'First Name',
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                            color: Colors.orange[700],
                          ),
                          validator: (value) {
                            bool firstnameValid =
                                RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$')
                                    .hasMatch(value!);

                            if (value.isEmpty) {
                              return "Enter your first name";
                            } else if (!firstnameValid) {
                              return "Enter valid name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PrimaryTextFormField(
                          controller: lastnameController,
                          hintText: 'Last Name',
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                            color: Colors.orange[700],
                          ),
                          validator: (value) {
                            bool lastnameValid =
                                RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$')
                                    .hasMatch(value!);

                            if (value.isEmpty) {
                              return "Enter your last name";
                            } else if (!lastnameValid) {
                              return "Enter valid name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PrimaryTextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'example@gmail.com',
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.orange[700],
                          ),
                          validator: (value) {
                            bool emailValid =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value!);
                            if (value.isEmpty) {
                              return "Enter email address";
                            } else if (!emailValid) {
                              return "Enter valid email address";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PrimaryTextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          hintText: '9824109234',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.orange[700],
                          ),
                          validator: (value) {
                            bool phoneValid =
                                RegExp(r'^98\d{0,8}$').hasMatch(value!);
                            if (value.isEmpty) {
                              return "Enter your phone number";
                            } else if (!phoneValid) {
                              return "Enter valid phone number";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PrimaryTextFormField(
                          controller: password1Controller,
                          obscureText: isHidden == true ? true : false,
                          hintText: 'Password',
                          prefixIcon:
                              Icon(Icons.lock, color: Colors.orange[700]),
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
                              width: 100,
                              child: Circularr_elevated_button(
                                btnName: 'Register',
                                onPressed: () {
                                  print("clicked");

                                  if (formkey.currentState!.validate()) {
                                    setState(() {
                                      firstname = firstnameController.text;
                                      lastname = lastnameController.text;
                                      email = emailController.text;
                                      phone = phoneController.text;
                                      password1 = password1Controller.text;
                                      password2 = password2Controller.text;
                                    });
                                    registration();
                                  } else {
                                    print("not validated");
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, a, b) =>
                                            MyLogin(),
                                        transitionDuration:
                                            Duration(seconds: 0),
                                      ),
                                      (route) => false);
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => MyLogin()),
                              //     );
                              //   },
                              //   child: Text(
                              //     "Login",
                              //     style: TextStyle(fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  registration() async {
    if (password1 == password2) {
      //create user
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password1);
        print(userCredential);
        //add user details here
        addUserDetails(
            firstnameController.text.trim(),
            lastnameController.text.trim(),
            emailController.text.trim(),
            int.parse(phoneController.text.trim()));

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text(
              "Registered Succssfully",
              style: TextStyle(fontSize: 20),
            ),
          ));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyLogin()),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print("Password Provided is too weak");
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Password Provided is too weak",
                style: TextStyle(fontSize: 20),
              ),
            ));
          }
        } else if (e.code == 'email-already-in-use') {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Account already exists",
                style: TextStyle(fontSize: 16),
              ),
            ));
          }
        }
        // print("Account already exists");
      }
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

  Future addUserDetails(
      String firstname, String lastname, String email, int phone) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstname,
      'last name': lastname,
      'phone number': phone,
      'email': email,
    });
  }
}
