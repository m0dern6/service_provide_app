import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:service_provide_app/models/category_model.dart';
import 'package:service_provide_app/provider/api_provider.dart';

class CustomerPortal extends StatefulWidget {
  final Color textColor;
  const CustomerPortal({super.key, this.textColor = Colors.black});

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
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: sliderImg.length,
                    itemBuilder: (context, index, realindex) {
                      final sliderimages = sliderImg[index];
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(sliderimages)),
                        ),
                      );
                    },
                    options: CarouselOptions(
                        viewportFraction: 0.8,
                        autoPlay: true,
                        height: 200,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        }),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 0,
                    left: 0,
                    child: DotsIndicator(
                      dotsCount: sliderImg.length,
                      position: _currentIndex.toDouble().toInt(),
                      decorator: const DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).primaryColor,
              ),
              child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Categories',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ),
            const SizedBox(height: 10),
            Consumer<ApiProvider>(builder: (context, apiProvider, child) {
              final categories = apiProvider.categories;
              return MasonryGridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final categoryData = categories[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryService(
                                      categoryData: categoryData,
                                    )));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child:
                                    Image.network(categoryData.CategoryImage)),
                          ),
                          Text(
                            categoryData.CategoryName,
                            style: TextStyle(
                                color: widget.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}

class CategoryService extends StatefulWidget {
  final CategoryModel categoryData;
  const CategoryService({super.key, required this.categoryData});

  @override
  State<CategoryService> createState() => _CategoryServiceState();
}

class _CategoryServiceState extends State<CategoryService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryData.CategoryName),
      ),
      body: ListView.builder(
          itemCount: widget.categoryData.Services.length,
          itemBuilder: (context, index) {
            final serviceData = widget.categoryData.Services[index];
            return ListTile(
              title: Text(serviceData.ServiceName),
              trailing: Text('Rs ${serviceData.Price}'),
            );
          }),
    );
  }
}
