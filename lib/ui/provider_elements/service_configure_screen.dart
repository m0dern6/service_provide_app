import 'package:flutter/material.dart';

class ServiceConfigureScreen extends StatefulWidget {
  const ServiceConfigureScreen({super.key});

  @override
  State<ServiceConfigureScreen> createState() => _ServiceConfigureScreenState();
}

class _ServiceConfigureScreenState extends State<ServiceConfigureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Configure your service facility'),
    );
  }
}
