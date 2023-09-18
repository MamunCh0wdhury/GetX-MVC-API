import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_api_tutorial/Controller/api_controller.dart';
import 'package:get_api_tutorial/Model/UserModel.dart';
import 'package:get_api_tutorial/View/view_userdetails.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: apiController.getUser(),
          builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: apiController.userList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          child: Text(snapshot.data![index].id.toString())),
                      title: Text(snapshot.data![index].name.toString()),
                      onTap: () {
                        Get.to(
                          () => UserView(
                            UserModel(
                              address: snapshot.data![index].address,
                              company: snapshot.data![index].company,
                              id: snapshot.data![index].id,
                              username:
                                  snapshot.data![index].username.toString(),
                              website: snapshot.data![index].website.toString(),
                              email: snapshot.data![index].email.toString(),
                              phone: snapshot.data![index].phone.toString(),
                              name: snapshot.data![index].name.toString(),
                            ),
                          ),
                        );
                      },
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
