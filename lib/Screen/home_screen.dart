import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/Widgets/Appbar/appbar_element.dart';
import 'package:instagram/Widgets/InstagramPostsScroll/instagram_post.dart';
import 'package:instagram/Widgets/Story/StoriesList.dart';
import 'package:instagram/Widgets/bottom_bar_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        // Exit app immediately when back is pressed
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else {
          exit(0);
        }
        return false; // Prevent default back navigation
      },
      // canPop: false,

      child: SizedBox(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                  //backgroundColor: Colors.yellowAccent,
                  automaticallyImplyLeading: false,
                  floating: true, // Allows AppBar to scroll away when scrolling up
                  pinned: false, // AppBar disappears when scrolling
                  snap: true, // AppBar snaps back when scrolling down
                  expandedHeight: screenHeight * 0.1,
                  toolbarHeight: screenHeight * 0.1,// Fixed height for AppBar

                  title: AppbarElement(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  )),
              //Main Body
              SliverToBoxAdapter(
                child: Container(
                  height: screenHeight * 0.16,
                  width: double.infinity,
                 // color: Colors.red,
                  child: Storieslist(),
                ),
              ),

              InstagramPostFeed(),


              //SliverAnimatedList(itemBuilder: itemBuilder)
            ],
          ),
          bottomNavigationBar:BottomBarNavigation(
            iconSize: screenWidth * 0.09,
          ),
        ),
      ),
    );
  }
}

