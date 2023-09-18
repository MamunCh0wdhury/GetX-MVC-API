import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_api_tutorial/Controller/api_controller.dart';

class MyPhotos extends StatefulWidget {
  const MyPhotos({super.key});

  @override
  State<MyPhotos> createState() => _MyPhotosState();
}

class _MyPhotosState extends State<MyPhotos> {
  ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SizedBox(
      height: size.height,
      width: double.infinity,
      child: GridView.builder(
          itemCount: apiController.photos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            var currentPhoto = apiController.photos[index];
            return Card(
              child: Image.network(currentPhoto.url),
            );
          }),
    ));
  }
}
