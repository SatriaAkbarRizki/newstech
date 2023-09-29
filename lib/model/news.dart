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
      image_url: json['image_url'],
      link: json['link']);
}
