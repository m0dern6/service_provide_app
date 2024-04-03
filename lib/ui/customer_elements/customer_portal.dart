import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:service_provide_app/models/category_model.dart';
import 'package:service_provide_app/ui/customer_home_screen.dart';

class CustomerPortal extends StatefulWidget {
  final List categories;

  const CustomerPortal({super.key, required this.categories});

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
        Stack(
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
        Expanded(
          child: FutureBuilder<List<CategoryModel>>(
              future: fetchCategory(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final category = snapshot.data!;

                  return ListView.builder(
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(category[index].CategoryName),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ],
    ));
  }
}
