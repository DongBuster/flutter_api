// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelNew {
  late String title;
  late String description;
  late String author;
  late String urlToImage;
  late String publishedAt;
  ModelNew({
    required this.title,
    required this.description,
    required this.author,
    required this.urlToImage,
    required this.publishedAt,
  });
  ModelNew.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        description = json['description'] ?? '',
        author = json['author'] ?? '',
        urlToImage = json['urlToImage'] ?? '',
        publishedAt = json['publishedAt'] as String;
}
