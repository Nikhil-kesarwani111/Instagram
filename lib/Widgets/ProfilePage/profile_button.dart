import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Follow Button (Outlined)
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Theme.of(context).colorScheme.primary), // Border color
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Button size
            ),
            child: Text(
              "Follow",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary, // Text color
              ),
            ),
          ),

          // Message Button (Grey Background)
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary, // Button background
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Button size
            ),
            child: Text(
              "Message",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary, // Text color
              ),
            ),
          ),

          // Contact Button (Grey Background)
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary, // Button background
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Button size
            ),
            child: Text(
              "Contact",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary, // Text color
              ),
            ),
          ),

          // Add Person Icon Button (Grey Background)
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary, // Button background
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded
              padding: EdgeInsets.all(10), // Button size
            ),
            child: Icon(
              CupertinoIcons.person_badge_plus_fill,
              color: Theme.of(context).colorScheme.onSecondary, // Icon color
            ),
          ),
        ],
      ),
    );
  }
}
