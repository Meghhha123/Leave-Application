import 'package:flutter/material.dart';
import 'package:myfirst_app/comman.dart';
import 'package:myfirst_app/leaveform.dart';
import 'package:myfirst_app/main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showLogoutDialog(context);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(239, 254, 241, 1),
        appBar: AppBar(
          title: const Text('HOME'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () {
                showLogoutDialog(context);
              },
            )
          ],
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.home))
        ),
        drawer: Drawer(
          backgroundColor: Color.fromRGBO(239, 254, 241, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: Colors.teal,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: const [
                      Text(
                        'Emp_Leave',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Divider(),
                      Text(
                        'Intern',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Divider(),
                      Text(
                        'Developer',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              //   child: ListTile(
              //     leading: Icon(Icons.home),
              //     title: const Text('Home'),
              //     onTap: () {
              //       // Update the state of the app.
              //       // ...
              //     },
              //   ),
              // ),
              // Container(
              //   decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              //   child: ListTile(
              //     leading: Icon(Icons.assignment),
              //     title: const Text(''),
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => leaveForm()),
              //       );
              //     },
              //   ),
              // ),
              // Container(
              //   decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              //   child: ListTile(
              //     leading: Icon(Icons.login_outlined),
              //     title: const Text('Logout'),
              //     onTap: () {
              //       // Update the state of the app.
              //       // ...
              //     },
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
                child: Card(
                  elevation: 10,
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3))),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.teal, width: 5))),
                      child: const Text('HOME'),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const leaveForm()),
                  );
                },
                child: Card(
                  elevation: 10,
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3))),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.teal, width: 5))),
                      child: const Text('Apply for leave'),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showLogoutDialog(context);
                },
                child: Card(
                  elevation: 10,
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3))),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.teal, width: 5))),
                      child: const Text('LOGOUT'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const leaveForm()),
                  );
                },
                child: const Text('Apply for leave'))
          ],
        ),
      ),
    );
  }
}
