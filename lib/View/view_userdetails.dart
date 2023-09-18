import 'package:flutter/material.dart';
import 'package:get_api_tutorial/Model/UserModel.dart';

class UserView extends StatelessWidget {
  final UserModel user;

  const UserView(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.name.toString()),
            Text(user.phone.toString()),
            Text(user.email.toString()),
            Text(user.website.toString()),
            Text(user.company.toString()),
            Text(user.id.toString()),
            Text(user.username.toString()),
            Text(user.address!.city.toString()),
            Text(user.address!.zipcode.toString()),
            Text(user.address!.street.toString()),
            Text(user.address!.suite.toString()),
            Text(user.company!.name.toString()),
          ],
        ),
      ),
    );
  }
}
