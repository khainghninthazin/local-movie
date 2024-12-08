import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/app/data/color_constants.dart';
import 'package:movie_app/app/modules/home/controllers/recommened_page_controller.dart';

import '../controllers/recommened_detail_page_controller.dart';

class RecommenedDetailPageView extends GetView<RecommenedDetailPageController> {
  RecommenedDetailPageView({super.key});
 

  final recontroller=Get.put(RecommenedPageController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsts.backgroun,
      appBar: AppBar(
        backgroundColor: ColorConsts.backgroun,
        title: const Text(
          'RecommenedDetailPageView',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
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
                   Container(
                padding: const EdgeInsets.only(right: 20),
                height: 20,
                child: Image.asset('assets/filter.png',color: Colors.white,),
              )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
            
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 300,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Get.toNamed('/movie-detail'),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey[850],
                            ),
                            
                            child: Column(
                              children: [  
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16)
                                  ),
                                  child: Image.network('https://th.bing.com/th/id/R.e38c3f2ee169a496231f07d03cb9a5f2?rik=61uV2lDSXuI5zg&riu=http%3a%2f%2fthefilmstage.com%2fwp-content%2fuploads%2f2014%2f11%2famerican_heist_poster_2-620x883.png&ehk=AYEGYYioUAaq8utgpZofFbkJAOzii4yYr%2bRCasnEB7M%3d&risl=&pid=ImgRaw&r=0',height: 200,width: double.infinity,fit: BoxFit.cover,),
                                ),
                                          
                                Padding(padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(recontroller.popularmodel[index].title,style: const TextStyle(color: Colors.white),),
                                     Row(
                                      children: [
                                        Text(recontroller.popularmodel[index].voteCount.toString(),style: TextStyle(color: Colors.grey)),Spacer(),
                                        Icon(Icons.favorite,color: Colors.white,),
                                      ],
                                    ),
                                   
                                   
                                   
                                  ],
                                ),
                                )
                                          
                                          
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
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
