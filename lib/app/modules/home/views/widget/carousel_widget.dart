import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int currentIndex = 0;
  final List<String> images = [
    'assets/m1.jpeg',
    'assets/m2.jpeg',
    'assets/m1.jpeg',
  ];

  final List<String>textlist=[
    'Black panther:wakanda forever, '
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            CarouselSlider(
              items: [
                _carouselitem('assets/m1.jpeg', 'Black Panther Wakanda Forever''On March 2, 2022'),
                _carouselitem('assets/m2.jpeg','Black Panther Wakanda Forever''On March 2, 2022'),
                _carouselitem('assets/m1.jpeg','Black Panther Wakanda Forever''On March 2, 2022')
              ],
                      
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                autoPlay: true,
                // aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            
          ],
        ),
        const SizedBox(height: 20),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: images.length,
          effect: const ScrollingDotsEffect(
            dotWidth: 13,
            dotHeight: 6,
            activeDotColor: Colors.blue,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
Widget _carouselitem(String imagepath,String text){
  return Stack (
    fit: StackFit.expand,
    children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imagepath,),fit: BoxFit.cover)
        ),
        ),
      Container(
        
        padding: const EdgeInsets.only(top: 120,left: 17),
        child: Text(text,style: const TextStyle(fontSize: 17,color: Colors.white),),
      )
    ],
  );
}
