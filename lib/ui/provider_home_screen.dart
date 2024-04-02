import 'package:flutter/material.dart';
import 'package:service_provide_app/ui/provider_elements/provider_portal.dart';
import 'package:service_provide_app/ui/provider_elements/provider_setting.dart';
import 'package:service_provide_app/ui/provider_elements/service_configure_screen.dart';

class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    late Widget currentPage;
    switch (_currentIndex) {
      case 0:
        currentPage = ProviderPortal();
        break;
      case 1:
        currentPage = ServiceConfigureScreen();
        break;
      case 2:
        currentPage = ProviderSettingScreen();
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Provider'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Configure',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: currentPage,
    );
  }
}
