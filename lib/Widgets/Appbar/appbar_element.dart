import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/Provider/ThemeProvider.dart';
import 'package:instagram/Widgets/Text/instagram_logo.dart';
import 'package:provider/provider.dart';

class AppbarElement extends StatelessWidget {
  const AppbarElement({super.key, required this.screenHeight, required this.screenWidth});

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    final theme = Theme.of(context); // Get current theme

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: screenHeight * 0.07,
            child: InstagramLogo(textsize: screenWidth * 0.11),
          ),
        ),
        Row(
          children: [
            Icon(
              CupertinoIcons.heart,
              size: screenHeight * 0.04,
              color: theme.colorScheme.onSurface, // Uses theme color
            ),
            SizedBox(width: screenWidth * 0.04),
            Icon(
              FontAwesomeIcons.facebookMessenger,
              size: screenHeight * 0.04,
              color: theme.colorScheme.onSurface, // Uses theme color
            ),
            SizedBox(width: screenWidth * 0.02),
          ],
        ),
      ],
    );
  }
}
