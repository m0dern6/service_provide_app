import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:service_provide_app/models/category_model.dart';
import 'package:service_provide_app/ui/customer_elements/customer_portal.dart';
import 'package:service_provide_app/ui/customer_elements/customer_settings.dart';
import 'package:service_provide_app/ui/customer_elements/services.dart';
import 'package:http/http.dart' as http;

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _currentIndex = 0;
  List<CategoryModel> _categories = [];
  @override
  void initState() {
    super.initState();
    fetchCategory().then((categories) {
      setState(() {
        _categories = categories;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget _currentPage;
    switch (_currentIndex) {
      case 0:
        _currentPage = CustomerPortal(categories: _categories);
        break;
      case 1:
        _currentPage = Services();
        break;
      case 2:
        _currentPage = CustomerSettingScreen();
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Service Pro'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Orders'),
        ],
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

Future<List<CategoryModel>> fetchCategory() async {
  final response =
      await http.get(Uri.parse("http://192.168.1.64:3002/category"));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List;
    return data
        .map((categoryData) => CategoryModel.fromJson(categoryData))
        .toList();
  } else {
    throw Exception('Failed to load categories');
  }
}
