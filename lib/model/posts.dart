class Post {
  final int id;
  final String title;
  final String body;
  final String time;
  final String? imageUrl;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.time,
    this.imageUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: int.parse(json['id']),
        title: json['title'],
        body: json['body'],
        time: json['time'],
        imageUrl: json['imageUrl']);
  }
}
