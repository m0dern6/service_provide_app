import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_provide_app/provider/api_provider.dart';

class Services extends StatefulWidget {
  final Color textColor;
  const Services({Key? key, this.textColor = Colors.black});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  Color textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(builder: (context, apiProvider, child) {
      final services = apiProvider.categories
          .expand((category) => category.Services)
          .toList();
      return ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            final serviceData = services[index];

            return ListTile(
              title: Text(
                serviceData.ServiceName,
                style: TextStyle(color: widget.textColor),
              ),
            );
          });
    });
  }
}
