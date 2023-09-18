import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_api_tutorial/Controller/api_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: apiController.getPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: apiController.postList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(apiController.postList[index].id.toString()),
                      subtitle: Text(apiController.postList[index].title.toString()),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
