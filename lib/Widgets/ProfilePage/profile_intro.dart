import 'package:flutter/material.dart';
import 'package:instagram/Model/ProfilePage.dart';
import 'package:instagram/Widgets/circular_avatar_story.dart';

class ProfileIntro extends StatelessWidget {
  const ProfileIntro({super.key,required this.pro});

  final ProfilePage pro;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularAvatarStory(imageUrl:pro.profilePic ?? " " ),
        ),

        SizedBox(width: 10),
        _buildStatColumn("Posts", pro.posts?.toString() ?? "0"),
        SizedBox(width: 20),
        _buildStatColumn("Followers", pro.followers?.toString() ?? "0"),
        SizedBox(width: 20),
        _buildStatColumn("Following", pro.following?.toString() ?? "0"),
      ],
    );
  }
}



Widget _buildStatColumn(String title, String value) {
  return Column(
    children: [
      Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Text(title),
    ],
  );
}