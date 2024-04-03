import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:service_provide_app/provider/api_provider.dart';

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
      body: Consumer<ApiProvider>(builder: (context, apiProvider, child) {
        final usersData = apiProvider.users;
        return Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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

                  final users = usersData.firstWhere(
                    (users) =>
                        users.Phone == phone && users.Password == password,
                  );

                  if (users.Role == 'Customer') {
                    Navigator.pushNamed(context, 'homeCustomer');
                  } else if (users.Role == 'Provider') {
                    Navigator.pushNamed(context, 'homeProvider');
                  } else {
                    print('User Name: ${users.Name}');
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
      }),
    );
  }
}
