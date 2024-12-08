import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/app/modules/home/controllers/recommened_page_controller.dart';

class RecommenedPageView extends GetView {
  const RecommenedPageView({super.key});
  @override
  Widget build(BuildContext context) {
    var recontroller = Get.put(RecommenedPageController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 17, bottom: 10),
              child: Text(
                'Recommended for you',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.toNamed('/recommened-detail-page');
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  'See All',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 17,
        ),

        //recommended card
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Horizontal scrolling
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: List.generate(
                recontroller.popularmodel.length,
                (index) => Container(
                  width: 170, // Set fixed width for each card
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/movie-detail');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200, // Set height for the image
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://th.bing.com/th/id/R.e38c3f2ee169a496231f07d03cb9a5f2?rik=61uV2lDSXuI5zg&riu=http%3a%2f%2fthefilmstage.com%2fwp-content%2fuploads%2f2014%2f11%2famerican_heist_poster_2-620x883.png&ehk=AYEGYYioUAaq8utgpZofFbkJAOzii4yYr%2bRCasnEB7M%3d&risl=&pid=ImgRaw&r=0'), // Movie image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15,left: 130),
                              child: Row(
                                children: [
                                  Positioned(
                                    top: 20,
                                   
                                    bottom: 20,
                                    child: const Icon(
                                      Icons.favorite,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                recontroller.popularmodel[index].title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                recontroller.popularmodel[index].overview,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    recontroller.popularmodel[index].voteCount
                                        .toString(), // Rating value
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
