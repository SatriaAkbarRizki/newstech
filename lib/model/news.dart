final String nothingImage =
    "https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80";

class NewsModel {
  final String title;
  final String description;
  final String image_url;
  final String link;

  NewsModel(
      {required this.title,
      required this.description,
      required this.image_url,
      required this.link});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
      title: json['title'],
      description: json['description'],
      image_url: json['image_url'] ?? nothingImage,
      link: json['link']);
}
