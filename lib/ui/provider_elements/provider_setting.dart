import 'package:flutter/material.dart';

class ProviderSettingScreen extends StatefulWidget {
  const ProviderSettingScreen({super.key});

  @override
  State<ProviderSettingScreen> createState() => _ProviderSettingScreenState();
}

class _ProviderSettingScreenState extends State<ProviderSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Configure your profile'),
    );
  }
}
