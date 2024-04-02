import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:service_provide_app/Models/user_model.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Login'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            // return ListView.builder(
            //   itemCount: users.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(users[index].Name),
            //       subtitle: Text(users[index].Email),
            //       trailing: Image.network(users[index].Photo),
            //     );
            //   },
            // );
            return Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: passController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          final phone = phoneController.text;
                          final password = passController.text;

                          final user = users.firstWhere(
                            (user) =>
                                user.Phone == phone &&
                                user.Password == password,
                          );

                          if (user.Role == 'Customer') {
                            Navigator.pushNamed(context, 'homeCustomer');
                          } else if (user.Role == 'Provider') {
                            Navigator.pushNamed(context, 'homeProvider');
                          }
                        },
                        child: Container(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                  ]),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(
              child: Text('An error has occurred!'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Future<List<UserModel>> fetchUser() async {
  final response = await http.get(Uri.parse("http://192.168.1.64:3001/users"));
  // final response = await http.get(Uri.parse("http://localhost:3001/users"));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List;
    return data.map((userData) => UserModel.fromJson(userData)).toList();
  } else {
    throw Exception('Failed to load user data');
  }
}
