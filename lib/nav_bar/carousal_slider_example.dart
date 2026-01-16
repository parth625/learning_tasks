import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousalSliderExample extends StatefulWidget {
  const CarousalSliderExample({super.key});

  @override
  State<CarousalSliderExample> createState() => _CarousalSliderExampleState();
}

class _CarousalSliderExampleState extends State<CarousalSliderExample>
    with SingleTickerProviderStateMixin {
  final color = [
    Colors.red[200],
    Colors.green[200],
    Colors.amber[200],
    Colors.purple[200],
    Colors.blue[200],
  ];

  final images = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
    'assets/images/img5.jpg',
    'assets/images/img6.jpg',
  ];

  int currentPage = 0;

  PageController pageController = PageController(
    viewportFraction: 0.7,
    initialPage: 0,
  );

  late TabController tabController = TabController(
    length: images.length,
    vsync: this,
    initialIndex: currentPage,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 500,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Image.asset(images[index], fit: BoxFit.cover
                  ,),
              );
            },
            options: CarouselOptions(
              viewportFraction: 0.7,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayAnimationDuration: Duration(milliseconds: 500)
            )),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: SingleChildScrollView(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             // Basic Carousal slider
  //             SizedBox(
  //               height: 400,
  //               width: MediaQuery.sizeOf(context).width,
  //               child: PageView.builder(
  //                 controller: pageController,
  //                 pageSnapping: false,
  //                 padEnds: false,
  //                 itemCount: images.length,
  //                 onPageChanged: (value) {
  //                   tabController.animateTo(value);
  //                 },
  //                 itemBuilder: (context, index) {
  //                   return Container(
  //                     width: 300,
  //                     margin: EdgeInsets.all(12),
  //                     clipBehavior: Clip.antiAlias,
  //                     decoration: BoxDecoration(
  //                       // color: color[index],
  //                       borderRadius: BorderRadius.circular(25),
  //                     ),
  //                     child: Image.asset(images[index], fit: BoxFit.cover),
  //                   );
  //                 },
  //               ),
  //             ),
  //
  //             TabPageSelector(controller: tabController),
  //
  //             // SizedBox(
  //             //   height: 200,
  //             //   width: MediaQuery.sizeOf(context).width,
  //             //   child: PageView.builder(
  //             //     itemCount: images.length,
  //             //     controller: pageController,
  //             //
  //             //     itemBuilder: (context, index) {
  //             //       return Container(
  //             //         margin: EdgeInsets.all(12),
  //             //         clipBehavior: Clip.antiAlias,
  //             //         decoration: BoxDecoration(
  //             //           borderRadius: BorderRadius.circular(25),
  //             //         ),
  //             //         child: Image.asset(images[index], fit: BoxFit.cover),
  //             //       );
  //             //     },
  //             //   ),
  //             // ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
