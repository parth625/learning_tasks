import 'dart:async';

import 'package:flutter/material.dart';

class CarousalSliderExample extends StatefulWidget {
  const CarousalSliderExample({super.key});

  @override
  State<CarousalSliderExample> createState() => _CarousalSliderExampleState();
}

class _CarousalSliderExampleState extends State<CarousalSliderExample>
    with SingleTickerProviderStateMixin {
  final images = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
    'assets/images/img5.jpg',
    'assets/images/img6.jpg',
  ];

  int currentPage = 0;

  Timer? timer;

  CarouselController controller = CarouselController();

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
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.hasContentDimensions) {
        setState(() {
          currentPage =
              (controller.position.pixels /
                      controller.position.viewportDimension)
                  .round();
        });
      }
    });
    startScrolling();
  }

  void startScrolling() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      currentPage = (currentPage + 1) % images.length;

      controller.animateToItem(
        currentPage,
        curve: Curves.ease,
        duration: Duration(milliseconds: 500),
      );

      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              child: CarouselView(
                controller: controller,
                itemExtent: MediaQuery.sizeOf(context).width,
                itemSnapping: true,
                padding: EdgeInsets.all(10),

                children: List.generate(images.length, (index) {
                  return Image.asset(images[index], fit: BoxFit.cover);
                }),
              ),
            ),
            buildCarouselIndicator(),
          ],
        ),
      ),
    );
  }

  // Widget buildCarouselIndicator() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       for (int i = 0; i < images.length; i++)
  //         Container(
  //           height: i == currentPage ? 9 : 7,
  //           width: i == currentPage ? 9 : 7,
  //           margin: EdgeInsets.all(5),
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             color: i == currentPage ? Colors.black : Colors.grey,
  //           ),
  //         ),
  //     ],
  //   );
  // }

  Widget buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: .center,
      children: List.generate(images.length, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 5,
          width: currentPage.toInt() == index ? 25 : 10,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.black : Colors.grey,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}

/// Carousal slider using pageView
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Basic Carousal slider
//           SizedBox(
//             height: 400,
//             width: MediaQuery.sizeOf(context).width,
//             child: PageView.builder(
//               controller: pageController,
//               pageSnapping: false,
//               padEnds: false,
//               itemCount: images.length,
//               onPageChanged: (value) {
//                 tabController.animateTo(value);
//               },
//               itemBuilder: (context, index) {
//                 return Container(
//                   width: 300,
//                   margin: EdgeInsets.all(12),
//                   clipBehavior: Clip.antiAlias,
//                   decoration: BoxDecoration(
//                     // color: color[index],
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   child: Image.asset(images[index], fit: BoxFit.cover),
//                 );
//               },
//             ),
//           ),
//
//           TabPageSelector(controller: tabController),

// SizedBox(
//   height: 200,
//   width: MediaQuery.sizeOf(context).width,
//   child: PageView.builder(
//     itemCount: images.length,
//     controller: pageController,
//
//     itemBuilder: (context, index) {
//       return Container(
//         margin: EdgeInsets.all(12),
//         clipBehavior: Clip.antiAlias,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//         ),
//         child: Image.asset(images[index], fit: BoxFit.cover),
//       );
//     },
//   ),
// ),
//         ],
//       ),
//     ),
//   );
// }
// }

/// Carousal slider using package
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CarouselSlider.builder(
//             itemCount: images.length,
//
//             itemBuilder: (context, index, realIndex) {
//               return Container(
//                 margin: EdgeInsets.all(10),
//                 height: 500,
//                 width: double.infinity,
//                 clipBehavior: Clip.antiAlias,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//
//                 child: Image.asset(images[index], fit: BoxFit.cover),
//               );
//             },
//             options: CarouselOptions(
//               viewportFraction: 0.7,
//               autoPlay: true,
//               enlargeCenterPage: true,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   currentPage = index;
//                 });
//               },
//               autoPlayAnimationDuration: Duration(milliseconds: 500),
//             ),
//           ),
//           buildCarouselIndicator(),
//         ],
//       ),
//     ),
//   );
