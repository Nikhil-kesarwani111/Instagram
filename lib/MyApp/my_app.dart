import 'package:flutter/material.dart';
import 'package:instagram/Navigation/routes.dart';
import 'package:instagram/Navigation/routes_name.dart';
import 'package:instagram/Provider/ThemeProvider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Instagram',
            themeMode: themeProvider.themeMode,
            // Apply theme mode
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.light(
                primary: Colors.blue,
                // Follow button color
                secondary: Colors.grey.shade300,
                // Message button background
                tertiary: Colors.green,
                // Contact button background
                surface: Colors.white,
                // App background color
                background: Colors.white,
                // General background color
                onPrimary: Colors.white,
                // Text color on primary button
                onSecondary: Colors.black,
                // Text color on secondary button
                onTertiary: Colors.white,
                // Text color on tertiary button
                onSurface: Colors.black, // Text color on surface background
              ),
            ),

            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: ColorScheme.dark(
                primary: Colors.blueAccent,
                // Follow button color in dark mode
                secondary: Colors.white10,
                // Message button background
                tertiary: Colors.teal,
                // Contact button background
                surface: Colors.black,
                // App background color
                background: Colors.black,
                // General background color
                onPrimary: Colors.white,
                // Text color on primary button
                onSecondary: Colors.white,
                // Text color on secondary button
                onTertiary: Colors.black,
                // Text color on tertiary button
                onSurface: Colors.white, // Text color on surface background
              ),
            ),


            initialRoute: RoutesName.splashscreen,
            onGenerateRoute: Routes.generateRoute,
          );
        });
  }

  }