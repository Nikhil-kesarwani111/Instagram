import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/Provider/SpecificLike.dart';
import 'package:provider/provider.dart';

class Rowbuttons extends StatelessWidget {
  const Rowbuttons({super.key,required this.postId});

  final String postId;

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<SpecificLikeProvide>(context, listen: false);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;


    return  Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Consumer<SpecificLikeProvide>(
            builder: (context, likeProvider, child) {
              bool isLiked = likeProvider.isLiked(postId);
              return InkWell(
                onTap: () => likeProvider.toggleLike(postId),
                child: Icon(
                  isLiked
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 24,
                  color: isLiked
                      ? Colors.red
                      : colorScheme.onSurface,
                ),
              );
            },
          ),
          const SizedBox(width: 15),
          Icon(FontAwesomeIcons.comment,
              size: 24, color: colorScheme.onSurface),
          const SizedBox(width: 15),
          Icon(FontAwesomeIcons.paperPlane,
              size: 24, color: colorScheme.onSurface),
          const Spacer(),
          Consumer<SpecificLikeProvide>(
            builder: (context, likeProvider, child) {
              bool isBookmarked = likeProvider.isBookmarked(postId);
              return IconButton(
                icon: Icon(
                  isBookmarked
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: isBookmarked
                      ? Colors.blue
                      : colorScheme.onSurface,
                  size: 24,
                ),
                onPressed: () => likeProvider.toggleBookmark(postId),
              );
            },
          ),
        ],
      ),
    );
  }
}
