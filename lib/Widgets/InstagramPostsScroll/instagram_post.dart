import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/Model/FeedPage.dart';
import 'package:instagram/Services/Stateservices.dart';
import 'package:instagram/Widgets/InstagramPostsScroll/RowButtons.dart';
import 'package:instagram/Widgets/InstagramPostsScroll/Shimmer.dart';

class InstagramPostFeed extends StatelessWidget {
  const InstagramPostFeed({super.key});

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return FutureBuilder<FeedPage>(
      future: statesServices.getStories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverFillRemaining(
              child: ShimmerPostFeed()
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
                child: Text('Error: ${snapshot.error}',
                    style: TextStyle(color: Colors.red))),
          );
        } else if (!snapshot.hasData ||
            snapshot.data?.posts == null ||
            snapshot.data!.posts!.isEmpty) {
          return const SliverFillRemaining(
            child: Center(child: Text('No posts available.')),
          );
        }

        final posts = snapshot.data!.posts!;

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final post = posts[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                child: Container(
                  color: colorScheme.surface, // Adapt background color
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Section
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  NetworkImage(post.profilePic ?? ''),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              post.username ?? 'Unknown',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const Spacer(),
                            Icon(Icons.more_vert, color: colorScheme.onSurface),
                          ],
                        ),
                      ),

                      // Post Image
                      Container(
                        height: 375, // 4:5 aspect ratio
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(post.image ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Action Buttons
                      Rowbuttons(
                        postId: post.username == null ? '' : post.username!,
                      ),

                      // Like by
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "${post.likes ?? '0'} likes",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface),
                        ),
                      ),

                      // Caption
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: colorScheme.onSurface),
                            children: [
                              TextSpan(
                                text: post.username ?? 'Unknown',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: " ${post.caption ?? ''}"),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
            childCount: posts.length,
          ),
        );
      },
    );
  }
}
