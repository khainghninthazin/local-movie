import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/app/data/color_constants.dart';
import 'package:movie_app/app/modules/download_page/views/download_page_view.dart';
import 'package:movie_app/app/modules/home/views/home_view.dart';

import 'package:movie_app/app/modules/profile_page/views/profile_page_view.dart';
import 'package:movie_app/app/modules/search_page/views/search_page_view.dart';
import '../controllers/footer_controller.dart';

class FooterView extends StatelessWidget {
  final FooterController footerController = Get.put(FooterController());

   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final tabs = [
      
      const HomeView(),
      const SearchPageView(),
      const DownloadPageView(),
      const ProfilePageView(),
       // Ensure this is the correct import
      
    ];

  FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Obx(
        () => IndexedStack(
          index: footerController.selectedIndex.value,
          children: tabs,
        ),
      ),
      bottomNavigationBar: 
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 0,),
           child: GNav(
            gap: 4,
            backgroundColor: ColorConsts.backgroun,
            tabBackgroundColor: ColorConsts.backgroun,
            
           
           
            onTabChange: (index) {
              footerController.selectedIndex.value = index;
            },
            padding: const EdgeInsets.all(20),
            tabs:  const [
              GButton(
                
                backgroundColor: ColorConsts.backgroun,
                icon: Icons.home,
                text: 'Home',
              ),
               GButton(
                backgroundColor: ColorConsts.backgroun,
                icon: Icons.search,
                text: 'search',
              ),
           
                GButton(
                backgroundColor: ColorConsts.backgroun,
                icon: Icons.download,
                text: 'download',
              ),
              
              GButton(
                backgroundColor: ColorConsts.backgroun,
                icon: Icons.person,
                text: 'profile',
              ),
            ],
                   ),
         ),
      );
    
  }
}
