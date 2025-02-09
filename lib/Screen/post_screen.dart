import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/Model/PostPage.dart';
import 'package:instagram/Provider/likeProvider.dart';
import 'package:instagram/Services/Stateservices.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  final StatesServices statesServices = StatesServices();

  PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final countProvider = Provider.of<LikeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Posts", style: TextStyle(color: colorScheme.onSurface)),
        backgroundColor: colorScheme.surface,
        centerTitle: true,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
      ),
      body: FutureBuilder<PostPAge>(
        future: statesServices.getPostData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}", style: TextStyle(color: colorScheme.onSurface)));
          } else if (snapshot.hasData) {
            PostPAge post = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Section
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(post.profilePic ?? ""),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          post.username ?? "Unknown",
                          style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.onSurface),
                        ),
                      ),
                      Icon(Icons.more_vert, color: colorScheme.onSurface),
                    ],
                  ),

                  SizedBox(height: 10),

                  // Post Image
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(post.image ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // Action Buttons
                  Row(
                    children: [
                      Consumer<LikeProvider>(builder: (context, like, child) {
                        return InkWell(
                          onTap: () {
                            like.toggleLike();
                          },
                          child: Icon(
                            like.isLike ? Icons.favorite : Icons.favorite_border,
                            size: 28,
                            color: like.isLike ? Colors.red : colorScheme.onSurface,
                          ),
                        );
                      }),
                      SizedBox(width: 15),
                      Icon(CupertinoIcons.chat_bubble, size: 28, color: colorScheme.onSurface),
                      SizedBox(width: 15),
                      Icon(CupertinoIcons.paperplane, size: 28, color: colorScheme.onSurface),
                      Spacer(),
                      Consumer<LikeProvider>(
                        builder: (context, likeProvider, child) {
                          return IconButton(
                            icon: Icon(
                              likeProvider.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                              color: likeProvider.isBookmarked ? colorScheme.primary : colorScheme.onSurface,
                            ),
                            onPressed: () {
                              likeProvider.toggleBookmark();
                            },
                          );
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 5),

                  // Likes Count
                  Consumer<LikeProvider>(
                    builder: (context, likeProvider, child) {
                      return Text(
                        "${(post.likes ?? 0) + likeProvider.likeCount} likes",
                        style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.onSurface),
                      );
                    },
                  ),

                  SizedBox(height: 5),

                  // Caption
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: colorScheme.onSurface),
                      children: [
                        TextSpan(
                          text: "${post.username ?? "Unknown"} ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: post.caption ?? ""),
                      ],
                    ),
                  ),

                  SizedBox(height: 5),

                  // Post Date
                  Text(
                    post.postDate ?? "Unknown date",
                    style: TextStyle(color: colorScheme.onSecondary, fontSize: 12),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text("No posts available", style: TextStyle(color: colorScheme.onSurface)));
          }
        },
      ),
    );
  }
}
