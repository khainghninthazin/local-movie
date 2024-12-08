import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MoviestackView extends GetView {
  const MoviestackView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBadge('13+'),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildBadge('Action'),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildBadge('IMAX'),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildBadge('2 Trailers'),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              '2h 13m',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Story Line',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Card is a build-in widget and a most used widget in flutter.'
              ' The card has a rounded corners around it with a slight elevation to give it a smooth and user-friendly look to the application. '
              'It has many customized properties like color, shape etc which can be used accordingly.',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cast and Crew',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            // Wrap ListView.builder with a SizedBox or Expanded
            SizedBox(
              height: 70, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Use horizontal if required
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/R.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            Text(
                              'Willion',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              'Director',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 17,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      )
    ]);
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
