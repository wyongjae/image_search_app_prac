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

// class ThumbnailList {
//   final List<Thumbnail> thumbnails;
//
//   ThumbnailList({
//     required this.thumbnails,
//   });
//
//   factory ThumbnailList.fromJson(List<dynamic> parsedJson) {
//     List<Thumbnail> datas = [];
//     datas = parsedJson.map((e) => Thumbnail.fromJson(e)).toList();
//
//     return ThumbnailList(thumbnails: datas);
//   }
// }