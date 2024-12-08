import 'package:get/get.dart';

import '../modules/download_page/bindings/download_page_binding.dart';
import '../modules/download_page/bindings/download_page_binding.dart';
import '../modules/download_page/views/download_page_view.dart';

import '../modules/footer/bindings/footer_binding.dart';
import '../modules/footer/views/footer_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/movie_detail/bindings/movie_detail_binding.dart';
import '../modules/movie_detail/views/movie_detail_view.dart';
import '../modules/profile_page/bindings/profile_page_binding.dart';
import '../modules/profile_page/views/profile_page_view.dart';
import '../modules/recommened_detail_page/bindings/recommened_detail_page_binding.dart';
import '../modules/recommened_detail_page/views/recommened_detail_page_view.dart';
import '../modules/search_page/bindings/search_page_binding.dart';
import '../modules/search_page/views/search_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.FOOTER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_DETAIL,
      page: () => MovieDetailsView(),
      binding: MovieDetailBinding(),
    ),
    GetPage(
      name: _Paths.FOOTER,
      page: () => FooterView(),
      binding: FooterBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PAGE,
      page: () => const SearchPageView(),
      binding: SearchPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.DOWNLOAD_PAGE,
      page: () => const DownloadPageView(),
      binding: DownloadPageBinding(),
      children: [
        GetPage(
          name: _Paths.DOWNLOAD_PAGE,
          page: () => const DownloadPageView(),
          binding: DownloadPageBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.RECOMMENED_DETAIL_PAGE,
      page: () => RecommenedDetailPageView(),
      binding: RecommenedDetailPageBinding(),
    ),
  ];
}
