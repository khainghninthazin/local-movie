import 'package:get/get.dart';
import 'package:movie_app/app/data/model.dart';


class MovieDetailsController extends GetxController {
  final movie = MovieModel(
    title: 'Spider-Man No Way Home',
    imagePath: 'assets/spiderman.jpg',
    releaseYear: '2021',
    duration: '148 Minutes',
    genre: 'Action',
    rating: 4.5,
    description:
        'For the first time in the cinematic history of Spider-Man, our friendly neighborhood hero’s identity is revealed, '
        'bringing his Super Hero responsibilities into conflict with his normal life and putting those he cares about most at risk.',
    badges: ['13+', 'Action', 'IMAX', '2 Trailers', '2h 13m'],
  ).obs;

  List<castdetail> castlist=[
    castdetail(
      name: 'Ben Affleck',
      postion: 'Spider-Man',
    ),
    castdetail(  
      name: 'Chris Evans',
      postion: 'Bruce Banner',
    ),
    castdetail(
      name: 'Kate Winslet',
      postion: 'Natasha Romanoff',
    ),
    castdetail(
      name: 'Robert Downey Jr.',
      postion: 'Peter Parker',
    ),
    castdetail(
      name: 'Robert Zemeckis',
      postion: 'Dr. Octopus',
    ),
    castdetail(
      name: 'Jennifer Lawrence',
      postion: 'Tony Stark',
    ),
    castdetail(
      name: 'Chadwick Boseman',
      postion: 'Thor',
    ),
    castdetail(
      name: 'Marlon Brando',
      postion: 'Hulk',
    ),
  ];


  
}
