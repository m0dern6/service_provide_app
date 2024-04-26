import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_provide_app/login_signup/login_screen.dart';
import 'package:service_provide_app/provider/api_provider.dart';

import 'package:service_provide_app/ui/splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ApiProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      title: 'My App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
