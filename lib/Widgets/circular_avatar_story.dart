import 'package:flutter/material.dart';

class CircularAvatarStory extends StatelessWidget {
  const CircularAvatarStory({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return  Container(
      padding: EdgeInsets.all(3), // Space between border and avatar
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          // Instagram-style gradient
          colors: [Colors.pink, Colors.orange, Colors.yellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: CircleAvatar(
        radius: 50, // Adjust size
        backgroundColor: isDarkMode ? Colors.black : Colors.white, // Adapt to theme
        child: CircleAvatar(
          radius: 46,
          backgroundImage: NetworkImage(imageUrl), // Direct image loading
        ),


      ),
    );
  }
}
