class Thumbnail {
  final String id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Thumbnail({
    required this.id,
    required this.url,
    required this.title,
    required this.thumbnailUrl,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      id: json['id'].toString(),
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
