class VideoData {
  VideoData({
    required this.total,
    required this.totalHits,
    required this.video,
  });
  late final int total;
  late final int totalHits;
  late final List<Video> video;

  VideoData.fromJson(Map<String, dynamic> json){
    total = json['total'];
    totalHits = json['totalHits'];
    video = List.from(json['hits']).map((e)=>Video.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['totalHits'] = totalHits;
    _data['hits'] = video.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Video {
  Video({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.duration,
    required this.pictureId,
    required this.videoSize,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageURL,
  });
  late final int id;
  late final String pageURL;
  late final String type;
  late final String tags;
  late final int duration;
  late final String pictureId;
  late final VideoSize videoSize;
  late final int views;
  late final int downloads;
  late final int likes;
  late final int comments;
  late final int userId;
  late final String user;
  late final String userImageURL;

  Video.fromJson(Map<String, dynamic> json){
    id = json['id'];
    pageURL = json['pageURL'];
    type = json['type'];
    tags = json['tags'];
    duration = json['duration'];
    pictureId = json['picture_id'];
    videoSize = VideoSize.fromJson(json['videos']);
    views = json['views'];
    downloads = json['downloads'];
    likes = json['likes'];
    comments = json['comments'];
    userId = json['user_id'];
    user = json['user'];
    userImageURL = json['userImageURL'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pageURL'] = pageURL;
    _data['type'] = type;
    _data['tags'] = tags;
    _data['duration'] = duration;
    _data['picture_id'] = pictureId;
    _data['videos'] = videoSize.toJson();
    _data['views'] = views;
    _data['downloads'] = downloads;
    _data['likes'] = likes;
    _data['comments'] = comments;
    _data['user_id'] = userId;
    _data['user'] = user;
    _data['userImageURL'] = userImageURL;
    return _data;
  }
}

class VideoSize {
  VideoSize({
    required this.large,
    required this.medium,
    required this.small,
    required this.tiny,
  });
  late final Large large;
  late final Medium medium;
  late final Small small;
  late final Tiny tiny;

  VideoSize.fromJson(Map<String, dynamic> json){
    large = Large.fromJson(json['large']);
    medium = Medium.fromJson(json['medium']);
    small = Small.fromJson(json['small']);
    tiny = Tiny.fromJson(json['tiny']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['large'] = large.toJson();
    _data['medium'] = medium.toJson();
    _data['small'] = small.toJson();
    _data['tiny'] = tiny.toJson();
    return _data;
  }
}

class Large {
  Large({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
  });
  late final String url;
  late final int width;
  late final int height;
  late final int size;

  Large.fromJson(Map<String, dynamic> json){
    url = json['url'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['width'] = width;
    _data['height'] = height;
    _data['size'] = size;
    return _data;
  }
}

class Medium {
  Medium({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
  });
  late final String url;
  late final int width;
  late final int height;
  late final int size;

  Medium.fromJson(Map<String, dynamic> json){
    url = json['url'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['width'] = width;
    _data['height'] = height;
    _data['size'] = size;
    return _data;
  }
}

class Small {
  Small({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
  });
  late final String url;
  late final int width;
  late final int height;
  late final int size;

  Small.fromJson(Map<String, dynamic> json){
    url = json['url'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['width'] = width;
    _data['height'] = height;
    _data['size'] = size;
    return _data;
  }
}

class Tiny {
  Tiny({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
  });
  late final String url;
  late final int width;
  late final int height;
  late final int size;

  Tiny.fromJson(Map<String, dynamic> json){
    url = json['url'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['width'] = width;
    _data['height'] = height;
    _data['size'] = size;
    return _data;
  }
}