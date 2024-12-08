import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:movie_app/app/data/color_constants.dart';
import 'package:movie_app/app/modules/home/views/category_page_view.dart';

import 'package:movie_app/app/modules/home/views/recommened_page_view.dart';

import 'package:movie_app/app/modules/home/views/widget/carousel_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConsts.appbarcolor,
        leading: Container(
          margin: const EdgeInsets.only(
            left: 15,
          ),
          child: const GFAvatar(
            backgroundImage: AssetImage('assets/R.jpeg'),
            shape: GFAvatarShape.circle,
          ),
        ),

        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Smith',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Let's stream your favorite movie",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            )
          ],
        ),

        //Favorite Icon

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: ColorConsts.backgroun,
                borderRadius: BorderRadius.circular(18),
              ),
              child: IconButton(
                onPressed: () {
                  // Favorite button action
                },
                icon: const Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),

      // bottomNavigationBar: NavigationBar(
      backgroundColor: ColorConsts.backgroun,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.white),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(
                        height: 1, // Vertical space for the divider
                        thickness: 1, // Thickness of the divider line
                        color: Colors.white, // Color of the divider
                        indent: 20, // Space from the left side
                        endIndent: 20, // Space from the right side
                      ),
                      const SizedBox(
                          height:
                              10), // Optional spacing between Divider and Container
                      Container(
                        padding: const EdgeInsets.only(
                            right: 17), // Padding only on the right
                        height: 28, // Fixed height for the container
                        child: Image.asset(
                          'assets/filter.png', // Path to the image in your assets
                          color: Colors.white, // Tint color for the image
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CarouselWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const RecommenedPageView(),
                  const SizedBox(
                    height: 30,
                  ),
                  CategoryPageView(),
                ],
              ),
            ),
          )

          // Additional Content Placeholder

          //foote
        ],
      ),
    );
  }
}
