import 'package:flutter/material.dart';
import 'package:service_provide_app/login_signup/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerProfile extends StatefulWidget {
  final String token;
  const CustomerProfile({super.key, required this.token});

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  String? token;

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(onLoginSuccess: getToken),
      ),
    );
  }

  Future<void> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.35,
            minChildSize: 0.1,
            builder: (context, controller) {
              return ListView(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Language',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_forward_ios, size: 30),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.feedback_outlined,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Help/Feedback',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_forward_ios, size: 30),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Settings',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_forward_ios, size: 30),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _logout();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.logout_rounded,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Logout',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.arrow_forward_ios, size: 30),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
