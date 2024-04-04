import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_provide_app/provider/api_provider.dart';

class CustomerPortal extends StatefulWidget {
  const CustomerPortal({super.key});

  @override
  State<CustomerPortal> createState() => _CustomerPortalState();
}

class _CustomerPortalState extends State<CustomerPortal> {
  final sliderImg = [
    "https://cdn.pixabay.com/photo/2023/08/22/10/52/city-8206042_640.png",
    "https://cdn.pixabay.com/photo/2023/08/19/13/42/water-8200502_1280.jpg",
    "https://cdn.pixabay.com/photo/2023/08/20/08/30/luis-i-bridge-8201941_640.jpg",
    "https://cdn.pixabay.com/photo/2024/03/01/16/25/costa-rica-8606850_640.jpg",
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Stack(
            children: [
              CarouselSlider.builder(
                itemCount: sliderImg.length,
                itemBuilder: (context, index, realindex) {
                  final sliderimages = sliderImg[index];
                  return Container(
                    child: Image.network(sliderimages),
                  );
                },
                options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: DotsIndicator(
                  dotsCount: sliderImg.length,
                  position: _currentIndex.toDouble().toInt(),
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Consumer<ApiProvider>(builder: (context, apiProvider, child) {
            final categories = apiProvider.categories;
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    final categoryData = categories[index];
                    return Expanded(
                        child: Column(
                      children: [
                        Container(
                          child: Image.network(categoryData.CategoryImage),
                        ),
                        Text(categoryData.CategoryName),
                      ],
                    ));
                  }),
            );
            // return ListView.builder(
            //     itemCount: categories.length,
            //     itemBuilder: (context, index) {
            //       final categoryData = categories[index];
            //       return ListTile(
            //         title: Text(categoryData.CategoryName),
            //       );
            //     });
          }),
        ),
      ],
    ));
  }
}
