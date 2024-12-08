import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/download_page_controller.dart';

class DownloadPageView extends GetView<DownloadPageController> {
  const DownloadPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DownloadPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DownloadPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
