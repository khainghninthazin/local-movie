import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/data/color_constants.dart';

import 'package:movie_app/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:movie_app/app/modules/movie_detail/views/moviestack_view.dart';

// ignore: must_be_immutable
class MovieDetailsView extends StatelessWidget {
  MovieDetailsView({super.key});
  var mcontroller = Get.put(MovieDetailsController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsts.backgroun,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              // Movie Poster and Back/Favorite Icons
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/m2.jpeg'), // Replace with your image asset
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorConsts.backgroun!
                            .withOpacity(0.7), // Adjust opacity here
                      ),
                    ),
                  ),

                  // Movie Title and Release Date
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Positioned(
                          top: 16,
                          left: 16,
                          child: InkWell(
                            onTap: () => Get.toNamed( '/footer'),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Center(
                            child: Text(
                              'Spiderman Noway',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: const Icon(Icons.favorite, color: Colors.red),
                        ),
                      ],
                    ),
                  ),

                  // MOvies image
                  Positioned(
                    top: 40,
                    left: 30,
                    right: 30,
                    bottom: 30,
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 400,
                            width: 200,
                            child: Image.asset('assets/m2.jpeg'),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Movie Description
                  const Positioned(
                    bottom: 100,
                    left: 60,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.calendar_today,
                            color: Colors.white70, size: 16),
                        SizedBox(width: 4),
                        Text('2021', style: TextStyle(color: Colors.white70)),
                        SizedBox(width: 16),
                        Icon(Icons.access_time,
                            color: Colors.white70, size: 16),
                        SizedBox(width: 4),
                        Text('148 Minutes',
                            style: TextStyle(color: Colors.white70)),
                        SizedBox(width: 16),
                        Icon(Icons.movie, color: Colors.white70, size: 16),
                        SizedBox(width: 4),
                        Text('Action', style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),

                  //movies rating
                  const Positioned(
                      bottom: 70,
                      left: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      )),

                  Positioned(
                    bottom: 10,
                    left: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('Play'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.download, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.link, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const MoviestackView(),
              const SizedBox(height: 16),
            ]
          ),
        ),
      ),
    );
  }

}
