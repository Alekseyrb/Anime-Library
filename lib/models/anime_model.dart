class AnimeModel {
  final String? title;
  final String? url;
  final String? images;
  final String? trailer;
  final int? year;

  AnimeModel({this.title, this.url, this.images, this.trailer, this.year});

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      title: json['title'],
      url: json['url'],
      images: json['images']?['jpg']?['image_url'],
      trailer: json['trailer']?['url'],
      year: json['year'],
    );
  }
}