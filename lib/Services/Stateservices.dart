import 'dart:convert';

//import 'package:flutter/widgets.dart';
import 'package:instagram/Model/FeedPage.dart';
import 'package:instagram/Model/PostPage.dart';
import 'package:instagram/Model/ProfilePage.dart';
import 'package:instagram/Services/Api.dart';
import 'package:http/http.dart'as http;

class StatesServices{

Future<FeedPage> getStories () async{
  try {
    final response = await http.get(Uri.parse(AppUrl.feedPage));

    if (response.statusCode == 200) {
      return FeedPage.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load feed data. Status Code: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Error fetching data: $error');
  }

}//Now fetching data completed


Future< ProfilePage> getProfileData () async{
  try {
    final response = await http.get(Uri.parse(AppUrl.ProfilePage));

    if (response.statusCode == 200) {
      return  ProfilePage.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load feed data. Status Code: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Error fetching data: $error');
  }

}//Now fetching data completed


Future< PostPAge> getPostData () async{
  try {
    final response = await http.get(Uri.parse(AppUrl.PostPage));

    if (response.statusCode == 200) {
      return  PostPAge.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load feed data. Status Code: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Error fetching data: $error');
  }

}//Now fetching data completed


}