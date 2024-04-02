import 'package:flutter/material.dart';

class CustomerSettingScreen extends StatefulWidget {
  const CustomerSettingScreen({super.key});

  @override
  State<CustomerSettingScreen> createState() => _CustomerSettingScreenState();
}

class _CustomerSettingScreenState extends State<CustomerSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Customer Setting'),
      ),
    );
  }
}
