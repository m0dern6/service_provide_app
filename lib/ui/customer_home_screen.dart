import 'package:flutter/material.dart';
import 'package:service_provide_app/ui/customer_elements/customer_portal.dart';
import 'package:service_provide_app/ui/customer_elements/customer_settings.dart';
import 'package:service_provide_app/ui/customer_elements/services.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    late Widget _currentPage;
    switch (_currentIndex) {
      case 0:
        _currentPage = const CustomerPortal();
        break;
      case 1:
        _currentPage = const Services();
        break;
      case 2:
        _currentPage = const CustomerSettingScreen();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'Service Pro',
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Services'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Orders'),
        ],
        unselectedItemColor: Colors.orangeAccent,
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _currentPage,
    );
  }
}
