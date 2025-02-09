import 'package:flutter/material.dart';
import 'package:instagram/Navigation/routes_name.dart';
import 'package:instagram/Screen/home_screen.dart';
import 'package:instagram/Screen/post_screen.dart';
import 'package:instagram/Screen/profile_page.dart';
import 'package:instagram/Screen/splash_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashscreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case RoutesName.profilepage :
        return MaterialPageRoute(builder: (context) => ProfilePageScreen());

      case RoutesName.postscreen:
        return MaterialPageRoute(builder: (context) => PostScreen());

      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(child: Text('No route defind')),
          );
        }
        );
    }
  }
}

