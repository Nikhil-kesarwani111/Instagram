import 'package:flutter/material.dart';
import 'package:instagram/Model/FeedPage.dart';
import 'package:instagram/Navigation/routes_name.dart';
import 'package:instagram/Services/Stateservices.dart';
import 'package:instagram/Widgets/Text/Instatext.dart';
import 'package:shimmer/shimmer.dart';
import 'package:instagram/Widgets/circular_avatar_story.dart';

class ListCircuar extends StatelessWidget {
  const ListCircuar({super.key}) ;


  @override
  Widget build(BuildContext context) {

    StatesServices statesSerfvices=StatesServices();
    return FutureBuilder<FeedPage>(
      future: statesSerfvices.getStories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
            children: List.generate(
              5, // Number of shimmer placeholders
                  (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100, // 2 * 50 (same as CircleAvatar outer radius)
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 60,
                        height: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final stories = snapshot.data!.stories!; // Extract stories list

        return Row(
          children: List.generate(
            stories.length,
                (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
              child: Container(
              //  color: Colors.red,
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.profilepage);
                  },
                  child: Column(
                    children: [
                      CircularAvatarStory(imageUrl: stories[index].profilePic ?? ''),
                      SizedBox(height: 5),
                      InstaTextStyle(text: stories[index].username ?? 'Unknown'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}