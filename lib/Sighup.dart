import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:myfirst_app/main.dart';

import 'Home.dart';
import 'comman.dart';

// ignore: camel_case_types
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

// ignore: camel_case_types
class _SignupPageState extends State<SignupPage> {
  final formKey2 = GlobalKey<FormState>();
  final cpass = TextEditingController();
  final conpass = TextEditingController();
  bool createpass = true;
  bool confirmpass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 254, 241, 1),
        appBar: AppBar(
          elevation: 10,
          title: const Text('Sign-up '),

          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.home))
        ),
        // drawer: Drawer(
        //   backgroundColor: Color.fromRGBO(239, 254, 241, 1),
        //   elevation: 10,
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: [
        //       Container(
        //         color: Colors.teal,
        //         height: 150,
        //         child: Padding(
        //           padding: const EdgeInsets.only(top: 30.0),
        //           child: Column(
        //             children: const [
        //               Text(
        //                 'Emp_Leave',
        //                 style: TextStyle(
        //                     color: Colors.white,
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 18),
        //               ),
        //               Divider(),
        //               Text(
        //                 'Intern',
        //                 style: TextStyle(
        //                     color: Colors.white,
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 18),
        //               ),
        //               Divider(),
        //               Text(
        //                 'Developer',
        //                 style: TextStyle(
        //                     color: Colors.white,
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 18),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => const Homepage()),
        //           );
        //         },
        //         child: Card(
        //           elevation: 10,
        //           child: ClipPath(
        //             clipper: ShapeBorderClipper(
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(3))),
        //             child: Container(
        //               padding: const EdgeInsets.all(16),
        //               decoration: const BoxDecoration(
        //                   border: Border(
        //                       left: BorderSide(color: Colors.teal, width: 5))),
        //               child: const Text('HOME'),
        //             ),
        //           ),
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => const SignupPage()),
        //           );
        //         },
        //         child: Card(
        //           elevation: 10,
        //           child: ClipPath(
        //             clipper: ShapeBorderClipper(
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(3))),
        //             child: Container(
        //               padding: const EdgeInsets.all(16),
        //               decoration: const BoxDecoration(
        //                   border: Border(
        //                       left: BorderSide(color: Colors.teal, width: 5))),
        //               child: const Text('Apply for leave'),
        //             ),
        //           ),
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () {
        //           showLogoutDialog(context);
        //         },
        //         child: Card(
        //           elevation: 10,
        //           child: ClipPath(
        //             clipper: ShapeBorderClipper(
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(3))),
        //             child: Container(
        //               padding: const EdgeInsets.all(16),
        //               decoration: const BoxDecoration(
        //                   border: Border(
        //                       left: BorderSide(color: Colors.teal, width: 5))),
        //               child: const Text('LOGOUT'),
        //             ),
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey2,
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid first name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'First name',
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid last name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person_2_outlined),
                          labelText: 'Last name',
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid email';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Please enter valid email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          icon: Icon(Icons.phone),
                          labelText: 'Contact number',
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please create valid password';
                          }
                          if (!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value)) {
                            return "Please enter valid password";
                          }
                          return null;
                        },
                        controller: cpass,
                        obscureText: createpass,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.create),
                            labelText: 'Create password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    //refresh UI
                                    if (createpass) {
                                      //if passenable == true, make it false
                                      createpass = false;
                                    } else {
                                      createpass =
                                          true; //if passenable == false, make it true
                                    }
                                  });
                                },
                                icon: Icon(createpass == true
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm password';
                          }

                          if (value != cpass.text) {
                            return "please match password";
                          }

                          return null;
                        },
                        controller: conpass,
                        obscureText: confirmpass,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            icon: Icon(Icons.edit),
                            labelText: 'Confirm password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    //refresh UI
                                    if (confirmpass) {
                                      //if passenable == true, make it false
                                      confirmpass = false;
                                    } else {
                                      confirmpass =
                                          true; //if passenable == false, make it true
                                    }
                                  });
                                },
                                icon: Icon(confirmpass == true
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (formKey2.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                    );
                                  }
                                  ;
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(fontSize: 20),
                                ))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
