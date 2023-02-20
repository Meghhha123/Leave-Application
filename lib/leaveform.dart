import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import 'Home.dart';
import 'comman.dart';

// ignore: camel_case_types
class leaveForm extends StatefulWidget {
  const leaveForm({super.key});

  @override
  State<leaveForm> createState() => _leaveFormState();
}

// ignore: camel_case_types
class _leaveFormState extends State<leaveForm> {
  TextEditingController dateinputfrom = TextEditingController();
  TextEditingController dateinputto = TextEditingController();
  TextEditingController textarea = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   dateinputfrom.text = ""; //set the initial value of text field
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 254, 241, 1),
      appBar: AppBar(
        elevation: 10,
        title: const Text('Leave Application'),

        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.home))
      ),
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(239, 254, 241, 1),
        elevation: 10,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Leave information:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please from date';
                        }
                        return null;
                      },
                      controller:
                          dateinputfrom, //editing controller of this TextField
                      decoration: InputDecoration(
                          // icon: Icon(Icons.calenda), //icon of text field
                          labelText: "From Date",
                          suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime
                                        .now(), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate = DateFormat('dd-MM-yyy')
                                      .format(pickedDate);
                                  Colors.black;
                                  //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement

                                  setState(() {
                                    dateinputfrom.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                              icon: const Icon(
                                  Icons.calendar_month)) //label text of field
                          ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
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
                          return 'Please enter to date';
                        }
                        return null;
                      },
                      controller:
                          dateinputto, //editing controller of this TextField
                      decoration: InputDecoration(
                          // icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "To Date",
                          suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(
                                        2000), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate = DateFormat('dd-MM-yyy')
                                      .format(pickedDate);
                                  Color:
                                  Colors.black;
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement

                                  setState(() {
                                    dateinputto.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                              icon: const Icon(
                                  Icons.calendar_month)) //label text of field
                          ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter total number of days';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Total number of days",
                          prefixIcon: Icon(Icons.calculate)),
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      // inputFormatters: <TextInputFormatter>[
                      //   FilteringTextInputFormatter.digitsOnly
                      // ], // Only numbers can be entered
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 8.0, left: 8, right: 8, bottom: 15),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter reason';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.edit),
                        labelText: 'Reason for leave',
                      ),
                    ),
                  ),
                ),
                const Divider(),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Contact during leave :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter contact';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.how_to_reg),
                        labelText: 'Contact name',
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
                          return 'Please enter valid name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      maxLength: 10,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: 'Contact number',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(),
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
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(fontSize: 20),
                              ))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
