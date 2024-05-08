import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:service_provide_app/design/create_review.dart';

import 'package:service_provide_app/provider/api_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future.delayed(const Duration(seconds: 2));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ApiProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _token;

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  Future<void> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    setState(() {
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      title: 'My App',
      debugShowCheckedModeBanner: false,
      home: CreateReview(),
      // home: _token != null ? CustomerHomeScreen(token: _token!) : LoginScreen(),
      // routes: {
      //   '/login': (context) => LoginScreen(),
      //   '/dashboard': (context) => CustomerHomeScreen(token: _token!),
      // },
    );
  }
}
