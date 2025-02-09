import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/Model/ProfilePage.dart';
import 'package:instagram/Services/Stateservices.dart';
import 'package:instagram/Widgets/ProfilePage/grid.dart';
import 'package:instagram/Widgets/ProfilePage/highlight.dart';
import 'package:instagram/Widgets/ProfilePage/profile_button.dart';
import 'package:instagram/Widgets/ProfilePage/profile_intro.dart';
import 'package:instagram/Widgets/ProfilePage/shimmer.dart';




class ProfilePageScreen extends StatelessWidget {


  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge?.color, // Dynamic text color
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // Dynamic background
        elevation: 2,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color), // Dynamic icon color
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Icon(Icons.notifications, color: Theme.of(context).iconTheme.color), // Dynamic color
          SizedBox(width: 15),
          Icon(Icons.more_vert, color: Theme.of(context).iconTheme.color),
          SizedBox(width: 10),
        ],
      ),
      body: FutureBuilder<ProfilePage>(
        future: statesServices.getProfileData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerWidget();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }

          ProfilePage profile = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileIntro(pro: profile),

                // bio
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(profile.username ?? "User", style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(profile.bio?.description ?? "No bio available"),
                      Text(profile.bio?.website ?? "No website"),
                    ],
                  ),
                ),

                // Button
                ProfileButton(),
                Highlight(highlights: profile.highlights!),
                Divider(),
                DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: Theme.of(context).colorScheme.primary, // Dynamic indicator color
                        tabs: [
                          Tab(icon: Icon(Icons.grid_on, color: Theme.of(context).iconTheme.color)),
                          Tab(icon: Icon(FontAwesomeIcons.pause, color: Theme.of(context).iconTheme.color)),
                          Tab(icon: Icon(Icons.person_pin, color: Theme.of(context).iconTheme.color)),
                        ],
                      ),
                      SizedBox(
                        height: 500,
                        child: TabBarView(
                          children: [
                            Grid(gallery: profile.gallery),
                            Center(
                              child: Text(
                                "Tagged Posts",
                                style: Theme.of(context).textTheme.bodyLarge, // Dynamic text color
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          );
        },
      ),
    );
  }

}







