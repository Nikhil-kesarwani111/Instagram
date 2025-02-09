class ProfilePage {
  String? username;
  String? profilePic;
  int? posts;
  int? followers;
  int? following;
  Bio? bio;
  List<Highlights>? highlights;
  List<Gallery>? gallery;

  ProfilePage(
      {this.username,
        this.profilePic,
        this.posts,
        this.followers,
        this.following,
        this.bio,
        this.highlights,
        this.gallery});

  ProfilePage.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    profilePic = json['profile_pic'];
    posts = json['posts'];
    followers = json['followers'];
    following = json['following'];
    bio = json['bio'] != null ? new Bio.fromJson(json['bio']) : null;
    if (json['highlights'] != null) {
      highlights = <Highlights>[];
      json['highlights'].forEach((v) {
        highlights!.add(new Highlights.fromJson(v));
      });
    }
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['profile_pic'] = this.profilePic;
    data['posts'] = this.posts;
    data['followers'] = this.followers;
    data['following'] = this.following;
    if (this.bio != null) {
      data['bio'] = this.bio!.toJson();
    }
    if (this.highlights != null) {
      data['highlights'] = this.highlights!.map((v) => v.toJson()).toList();
    }
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bio {
  String? designation;
  String? description;
  String? website;

  Bio({this.designation, this.description, this.website});

  Bio.fromJson(Map<String, dynamic> json) {
    designation = json['designation'];
    description = json['description'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['designation'] = this.designation;
    data['description'] = this.description;
    data['website'] = this.website;
    return data;
  }
}

class Highlights {
  String? title;
  String? cover;

  Highlights({this.title, this.cover});

  Highlights.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['cover'] = this.cover;
    return data;
  }
}

class Gallery {
  String? image;

  Gallery({this.image});

  Gallery.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}