//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/user_list.dart';
import 'package:flutter_project/user_repository.dart';


class login_page extends StatelessWidget {
  const login_page({super.key});

  @override
  Widget build(context) {
    TextEditingController textController1 = TextEditingController();
    TextEditingController textController2 = TextEditingController();
    var passwordVisible = false;
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController1,
                decoration: const InputDecoration(
                    label: Text("Username"), fillColor: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: !passwordVisible,
                controller: textController2,
                decoration: const InputDecoration(
                  // counterText: "*",

                  label: Text("Password"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final response = await user_repository().postJob(
                      name: textController1.text, job: textController2.text);

                  if (response["name"] == "raja" && response["job"] == "raja123") {
                      print("reached here");
                      Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) {
                        //TUDO: redirect here
                        return const user_list();
                      },
                     ),
                    );
                   } 
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Username or Password Invalid")));
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
