import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerProfile extends StatefulWidget {
  final String token;
  const CustomerProfile({super.key, required this.token});

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [CircleAvatar()],
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      _logout();
                    },
                    child: Text('Logout'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
