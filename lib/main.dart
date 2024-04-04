import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_provide_app/login_signup/login_screen.dart';
import 'package:service_provide_app/provider/api_provider.dart';
import 'package:service_provide_app/splash_screen/splash_screen.dart';
import 'package:service_provide_app/ui/customer_home_screen.dart';
import 'package:service_provide_app/ui/provider_home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ApiProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        'login': (context) => const LoginScreen(),
        'homeCustomer': (context) => const CustomerHomeScreen(),
        'homeProvider': (context) => const ProviderHomeScreen(),

        // '/services': (context) => const ServiceScreen(),
        // '/orders': (context) => const OrderScreen(),
      },
    );
  }
}
