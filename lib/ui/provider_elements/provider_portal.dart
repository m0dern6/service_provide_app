import 'package:flutter/material.dart';

class ProviderPortal extends StatefulWidget {
  const ProviderPortal({super.key});

  @override
  State<ProviderPortal> createState() => _ProviderPortalState();
}

class _ProviderPortalState extends State<ProviderPortal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Welcome to the provider home screen'),
    );
  }
}
