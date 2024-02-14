import 'package:flutter/material.dart';
import 'package:flutter_project/users_model.dart';

class user_detail extends StatelessWidget {
  const user_detail({super.key, required this.user});
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("User Detail Page",style: TextStyle(
          color: Colors.red,
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Image.network(user.avatar),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("User Id: ${user.id}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("First Name: ${user.firstName}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Last Name: ${user.lastName}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Email: ${user.email}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user.avatar),
            ),
          ],
        ),
      ),
    );
  }
}
