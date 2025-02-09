import 'package:flutter/material.dart';
import 'package:instagram/Widgets/Story/list_circuar.dart';
import 'package:instagram/Widgets/Text/Instatext.dart';
import 'package:instagram/Widgets/circular_avatar_story.dart';

class Storieslist extends StatelessWidget {
  const Storieslist({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    CircularAvatarStory(
                        imageUrl: 'https://images.unsplash.com/photo-1623577284502-d65cdc6ba0b6?q=80&w=2055&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.blue, // Instagram blue for the "+" icon
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2), // White outline
                        ),
                        child: Center(
                          child: Icon(Icons.add, size: 14, color: Colors.white), // Plus sign
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                InstaTextStyle(text: 'Your Story'),
              ],
            ),
            ListCircuar(), // Ensure this widget has proper constraints
          ],
        ),
      ),
    );
  }
}


