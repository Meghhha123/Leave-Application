import 'package:flutter/material.dart';
import 'package:myfirst_app/main.dart';

showLogoutDialog(BuildContext context1) {
  showDialog(
      context: context1,
      builder: (BuildContext context2) {
        return AlertDialog(
          elevation: 10,
          title: const Text("Are you sure, you want to logout?"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context2,
                    MaterialPageRoute(builder: (context1) => LoginPage()),
                  );
                },
                child: const Text(
                  'YES',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context2);
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 119, 121, 119)),
                child: const Text(
                  'NO',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
          ],
        );
      });
}

// emailErrorAlert(BuildContext context1) {
//   showDialog(
//       context: context1,
//       builder: (BuildContext context2) {
//         return AlertDialog(
//           title: const Text(
//             'Required!',
//             style: TextStyle(
//               color: Colors.red,
//             ),
//           ),
//           content: Text("Enter valid email"),
//           actions: <Widget>[
//             ElevatedButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context2).pop();
//               },
//             ),
//           ],
//         );
//       });
// }

// passErrorAlert(BuildContext context3) {
//   showDialog(
//       context: context3,
//       builder: (BuildContext context4) {
//         return AlertDialog(
//           title: const Text(
//             'Required!',
//             style: TextStyle(
//               color: Colors.red,
//             ),
//           ),
//           content: Text("Enter valid password"),
//           actions: <Widget>[
//             ElevatedButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context4).pop();
//               },
//             ),
//           ],
//         );
//       });
// }
