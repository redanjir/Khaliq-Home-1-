import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_apptest/pages/add_appliances_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ManageAppliancesPage extends StatefulWidget {
  @override
  _ManageAppliancesPageState createState() => _ManageAppliancesPageState();
}

class _ManageAppliancesPageState extends State<ManageAppliancesPage> {
  List<String> images = [
    "assets/images/fan.png",
    "assets/images/light-bulb.png",
    "assets/images/smart-tv.png",
    "assets/images/air-conditioner.png"
  ];

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('APPLIANCES', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                height: 400,
                autoPlay: true,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlayInterval: const Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                final countimage = images[index];
                return buildImage(countimage, index);
              },
            ),
            const SizedBox(height: 30,),
            buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String image, int index) => 
  GestureDetector(
    child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        //spacing between images
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, fit: BoxFit.scaleDown, height: 180, width: 300,),
            const SizedBox(height: 30), // Add some space between the image and text
            Text(
              _getApplianceName(index), // Retrieve appliance name based on index
              style: const TextStyle(fontSize: 30,  fontWeight: FontWeight.bold, color: Colors.black87), 
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddAppliancesPage()));
      },
  );

// Method to get the appliance name based on the index
String _getApplianceName(int index) {
  switch (index) {
    case 0:
      return 'Fans';
    case 1:
      return 'Lights';
    case 2:
      return 'TVs';
    case 3:
      return 'Air-Cons';
    default:
      return '';
  }
}


  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: images.length,
    effect: const SlideEffect(
      dotWidth: 20,
      dotHeight: 20,
      activeDotColor: Colors.black,
      dotColor: Colors.black12
    ),
  );
}
