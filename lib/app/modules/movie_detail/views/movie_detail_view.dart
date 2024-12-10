import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/data/color_constants.dart';
import 'package:movie_app/app/modules/movie_detail/controllers/movie_detail_controller.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final mcontroller = Get.put(MovieDetailsController());

    return Scaffold(
      backgroundColor: ColorConsts.backgroun,
      body: SingleChildScrollView(
        child: Obx(() {
          // Check if movieDetails is null or loading
          if (mcontroller.movieDetails.value == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final movie = mcontroller.movieDetails.value!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Background Image
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 550,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorConsts.backgroun!.withOpacity(0.9),
                        ),
                      ),
                    ),

                    Positioned(
                        top: 50,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () => Get.back(),
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                      )),
                                  Flexible(
                                    child: Text(
                                      mcontroller
                                          .movieDetails.value!.originalTitle,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                ),
                                Text(
                                  movie.releaseDate,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const SizedBox(
                                  height: 25,
                                  child: VerticalDivider(
                                    color: Colors.white,
                                    thickness: 2,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                ),
                                const Text('148 Minutes',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                const SizedBox(width: 5),
                                const SizedBox(
                                  height: 25,
                                  child: VerticalDivider(
                                    color: Colors.white,
                                    thickness: 2,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Icon(
                                  Icons.local_movies,
                                  color: Colors.white,
                                ),
                                const Text('Action',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 30,
                                ),
                                Text(
                                  movie.voteAverage.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    // Play action
                                  },
                                  icon: const Icon(Icons.play_arrow),
                                  label: const Text('Play'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.download,
                                      color: Colors.white),
                                  onPressed: () {
                                    // Download action
                                  },
                                ),
                                const SizedBox(
                                  width: 17,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.ios_share_sharp,
                                      color: Colors.white),
                                  onPressed: () {
                                    // Share link action
                                  },
                                ),
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
                const SizedBox(height: 24),
                // Title and Release Date

                // Rating and Duration

                Column(children: [
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Story Line',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          mcontroller.movieDetails.value!.overview!,
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
                            scrollDirection:
                                Axis.horizontal, // Use horizontal if required
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
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          'Director',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 15),
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
                ])
              ],
            ),
          );
        }),
      ),
    );
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
