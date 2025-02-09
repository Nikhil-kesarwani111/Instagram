class FeedPage {
  List<Stories>? stories;
  List<Posts>? posts;

  FeedPage({this.stories, this.posts});

  FeedPage.fromJson(Map<String, dynamic> json) {
    if (json['stories'] != null) {
      stories = <Stories>[];
      json['stories'].forEach((v) {
        stories!.add(new Stories.fromJson(v));
      });
    }
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stories != null) {
      data['stories'] = this.stories!.map((v) => v.toJson()).toList();
    }
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stories {
  String? username;
  String? profilePic;

  Stories({this.username, this.profilePic});

  Stories.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}

class Posts {
  String? username;
  String? profilePic;
  String? image;
  String? likes;
  String? caption;

  Posts({this.username, this.profilePic, this.image, this.likes, this.caption});

  Posts.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    profilePic = json['profile_pic'];
    image = json['image'];
    likes = json['likes'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['profile_pic'] = this.profilePic;
    data['image'] = this.image;
    data['likes'] = this.likes;
    data['caption'] = this.caption;
    return data;
  }
}