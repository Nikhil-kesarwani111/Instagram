import 'package:flutter/cupertino.dart';

class LikeProvider extends ChangeNotifier {
  bool _isLike = false;
  int _likeCount = 0; // Added like count

  bool _isBookmarked = false; // Added for bookmark

  bool get isLike => _isLike;
  int get likeCount => _likeCount;

  bool get isBookmarked => _isBookmarked;

  void toggleLike() {
    _isLike = !_isLike;
    _isLike ? _likeCount++ : _likeCount--; // Increase or decrease count
    notifyListeners();
  }

  void HomescreenPostlike() {
    _isLike = !_isLike;
    notifyListeners();
  }

  void toggleBookmark() {
    _isBookmarked = !_isBookmarked;
    notifyListeners();
  }
}
