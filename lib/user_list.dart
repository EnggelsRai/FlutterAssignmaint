import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/user_detail.dart';
import 'package:flutter_project/user_repository.dart';

class user_list extends StatefulWidget {
  const user_list({super.key});

  @override
  State<user_list> createState() => _UserListState();
}

class _UserListState extends State<user_list> {
  Future<Map<String, dynamic>> userData() async {
    Response response =
        await get(Uri.parse("https://reqres.in/api/users?page=2"));
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  String responseData = "Data Not Posted";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("User List",style: TextStyle(
          color: Colors.blue,
        ),
        ),
      ),
      body: FutureBuilder(
        future: user_repository().userData(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            final userList = snapshot.data!.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...userList.map(
                      (user) => InkWell(
                        onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(
                              builder: (ctx) {
                                return user_detail(
                                  user: user,
                                );
                              },
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(user.avatar),
                            ),
                            title: Text("${user.firstName} ${user.lastName}"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Text("No Data Available");
          }
        },
      ),
    );
  }
}
