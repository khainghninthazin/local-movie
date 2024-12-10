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
              // borderRadius: BorderRadius.circular(20),
              onTap: () {
                Get.toNamed('/recommened-detail-page');
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20,bottom: 10),
                child: Text(
                  'See All',
                  style: TextStyle(color: Colors.white,fontSize: 15),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 17,
        ),

        // Recommended Card
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
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      // Navigate to the movie details page
                      Get.toNamed( '/movie-detail', arguments: recontroller.popularmodel[index].id);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200, // Set height for the image
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${recontroller.popularmodel[index].poster_path}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 15, left: 130),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
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
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                    recontroller.popularmodel[index].voteCount.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
