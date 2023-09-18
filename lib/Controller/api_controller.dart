import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_api_tutorial/Model/PhotoModel.dart';
import 'package:get_api_tutorial/Model/PostModel.dart';
import 'package:get_api_tutorial/Model/UserModel.dart';
import 'package:http/http.dart';

class ApiController extends GetxController {
/*GET POSTS*/
  List<PostModel> postList = [];
  Future<List<PostModel>> getPost() async {
    final response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    postList.clear();
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  /*GET USER DETAIL*/

  List<UserModel> userList = [];

  Future<List<UserModel>> getUser() async {
    final res =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var userData = jsonDecode(res.body.toString());
    userList.clear();
    if (res.statusCode == 200) {
      for (Map i in userData) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  /*GET PHOTOS*/

  List<PhotoModel> photos = [];

  Future<List<PhotoModel>> getPhotos() async {
    final rest =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var deCodedData = jsonDecode(rest.body.toString());
    if (rest.statusCode == 200) {
      for (Map<String, dynamic> k in deCodedData) {
        photos.add(PhotoModel.fromJson(k));
      }
      return photos;
    } else {
      return photos;
    }
  }
}
