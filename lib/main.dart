import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/Sighup.dart';

import 'Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool check1 = false;
  bool passwordVisible = true;

  // validate() {}

  // void _Forgotpassword() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => SignupPage()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 254, 241, 1),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/1.png',
                    // height: 150,
                    // width: ,
                  ),
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Text(
              //     'LOGIN',
              //     style: TextStyle(
              //         color: Color.fromARGB(255, 9, 10, 10),
              //         fontSize: 40,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email ';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please enter valid email";
                    }

                    return null;
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email_outlined),
                    labelText: 'USER EMAIL',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid password';
                    }
                    if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) return "Please enter valid password.";

                    return null;
                  },
                  obscureText: passwordVisible,
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      labelText: 'PASSWORD',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              //refresh UI
                              if (passwordVisible) {
                                //if passenable == true, make it false
                                passwordVisible = false;
                              } else {
                                passwordVisible =
                                    true; //if passenable == false, make it true
                              }
                            });
                          },
                          icon: Icon(passwordVisible == true
                              ? Icons.visibility
                              : Icons.visibility_off))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        //navigate to forgot password
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                    const Spacer(),
                    Checkbox(
                      value: check1,
                      onChanged: (bool? value) {
                        //value returned when checkbox is clicked
                        setState(() {
                          check1 = value!;
                        });
                      },
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Homepage()),
                          );
                        }
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      )),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()),
                        );
                      },
                      child: const Text(
                        'Signup',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              // RichText(
              //   text: TextSpan(
              //       text: 'Forgot Password?',
              //       style: TextStyle(color: Colors.blue, fontSize: 17),
              //       recognizer: TapGestureRecognizer()
              //         ..onTap = () {
              //           _Forgotpassword();
              //         }),_outlined
              // ),
            ],
          ),
        ),
      ),
    );
    // floatingActionButton: FloatingActionButton(
    //   onPressed: _incrementCounter,
    //   tooltip: 'Increment',
    //   child: const Icon(Icons.add),
    // ), // This trailing comma makes auto-formatting nicer for build methods.
  }
}
