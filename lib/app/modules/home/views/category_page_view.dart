import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/app/modules/home/controllers/category_page_controller.dart';

class CategoryPageView extends GetView {
  CategoryPageView({super.key});
  @override
  final controller = Get.put(CategoryPageController());

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CategoryPageController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, right: 50, bottom: 10),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Selector
              // SizedBox(
              //   height: 40,
              //   child: Obx(
              //     () => ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: controller.categories.length,
              //       itemBuilder: (context, index) {
              //         bool isSelected = controller.selectedIndex.value == index;
              //         return Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 5),
              //           child: InkWell(
              //             onTap: () {
              //               controller
              //                   .selectCategory(index); // Change selected index
              //             },
              //             child: Ink(
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(18),
              //                 color: isSelected
              //                     ? Colors.black
              //                     : Colors.blueGrey[800],
              //               ),
              //               width: 100,
              //               height: 50,
              //               child: Center(
              //                 child: Text(
              //                   controller.categories[index].categoryName,
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 15,
              //                     fontWeight: isSelected
              //                         ? FontWeight.bold
              //                         : FontWeight.normal,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),

              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    controller.categories.length,
                    (index) => Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.05),
                      ),
                      child: Center(
                        child: Text(
                          controller.categories[index].categoryName,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Display Data for Selected Category
              // Obx(() => Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(left: 15),
              //           child: Text(
              //             'Selected Category: ${controller.selectedCategory.categoryName}',
              //             style: const TextStyle(
              //               fontSize: 18,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ],
              //     )),
            ],
          ),
        ),

         SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Horizontal scrolling
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: List.generate(
                controller.popularmodel.length,
                (index) => Container(
                  width: 170, // Set fixed width for each card
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Navigate to the movie details page
                      Get.toNamed( '/movie-detail', arguments: controller.popularmodel[index].id);
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
                                    'https://image.tmdb.org/t/p/w500${controller.popularmodel[index].poster_path}',
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
                                controller.popularmodel[index].title,
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
                                controller.popularmodel[index].overview,
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
                                    controller.popularmodel[index].voteCount.toString(),
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
        //card movies

        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
