import 'package:flutter/material.dart';
import 'package:instagram/Model/ProfilePage.dart';

class Highlight extends StatelessWidget {
  const Highlight({super.key, required this.highlights});

  final List<Highlights> ? highlights;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    if (highlights == null || highlights!.isEmpty) return SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: highlights!.map((highlight) {
          return  Column(
            children: [
              Container(
                padding: EdgeInsets.all(3), // Space for the outer gradient
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: isDarkMode
                        ? [Colors.white70, Colors.grey, Colors.white70] // Dark mode colors
                        : [Colors.yellow, Colors.orange, Colors.pink], // Instagram colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(3), // Space for white/black border
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDarkMode ? Colors.black : Colors.white, // Adjusts based on theme
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(highlight.cover ??""),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                highlight.title ?? "Highlight",
                style: TextStyle(
                  fontSize: 12,
                  color: isDarkMode ? Colors.white : Colors.black, // Text color adapts
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

}
