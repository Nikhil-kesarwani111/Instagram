import 'package:flutter/cupertino.dart';

class SpecificLikeProvide extends ChangeNotifier {
  final Map<String, bool> _likes = {};
  final Map<String, int> _likeCounts = {};
  final Map<String, bool> _bookmarks = {};

  bool isLiked(String postId) => _likes[postId] ?? false;
  int likeCount(String postId) => _likeCounts[postId] ?? 0;
  bool isBookmarked(String postId) => _bookmarks[postId] ?? false;

  void toggleLike(String postId) {
    _likes[postId] = !(_likes[postId] ?? false);
    _likes[postId]! ? _likeCounts[postId] = (_likeCounts[postId] ?? 0) + 1 : _likeCounts[postId] = (_likeCounts[postId] ?? 1) - 1;
    notifyListeners();
  }

  void toggleBookmark(String postId) {
    _bookmarks[postId] = !(_bookmarks[postId] ?? false);
    notifyListeners();
  }
}
