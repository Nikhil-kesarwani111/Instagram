class PostPAge {
  String? username;
  String? profilePic;
  String? image;
  int? likes;
  String? caption;
  String? postDate;
  String? postText;

  PostPAge(
      {this.username,
        this.profilePic,
        this.image,
        this.likes,
        this.caption,
        this.postDate,
        this.postText});

  PostPAge.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    profilePic = json['profile_pic'];
    image = json['image'];
    likes = json['likes'];
    caption = json['caption'];
    postDate = json['post_date'];
    postText = json['post_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['profile_pic'] = this.profilePic;
    data['image'] = this.image;
    data['likes'] = this.likes;
    data['caption'] = this.caption;
    data['post_date'] = this.postDate;
    data['post_text'] = this.postText;
    return data;
  }
}