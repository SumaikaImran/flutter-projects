class Comment {
  final String username;
  final String profileImageUrl;
  final String text;
  final String timeAgo;
  final bool liked;

  Comment({
    required this.username,
    required this.profileImageUrl,
    required this.text,
    required this.timeAgo,
    this.liked = false,
  });
}

final List<Comment> mockComments = [
  Comment(
    username: "jessica",
    profileImageUrl: "assets/images/profile1.png",
    text: "loooove their mango margs with shrimp tacos",
    timeAgo: "2 Hours ago",
  ),
  Comment(
    username: "tess38",
    profileImageUrl: "assets/images/profile2.png",
    text: "have you tried their chips and queso? Legit the best in town",
    timeAgo: "2 Hours ago",
  ),
  Comment(
    username: "ryguy",
    profileImageUrl: "assets/images/profile3.png",
    text: "😉",
    timeAgo: "1 Hour ago",
  ),
];
