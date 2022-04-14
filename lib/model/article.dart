import 'package:flutter/material.dart';

class Article {
  String author;
  String title;
  String content;
  String urlToImage;
  String publishedAt;

  Article({
    required this.author,
    required this.title,
    required this.content,
    required this.urlToImage,
    required this.publishedAt,
  });

  //! Memetakkan Json object ke model 
  factory Article.fromJson(Map<String, dynamic> json) => Article(
    //* object
    title: json["title"] ?? "Null",
    author: json["author"] ?? "Null",
    content: json["content"] ?? "Null",
    publishedAt: json["publishedAt"] ?? "Null",
    urlToImage: json["urlToImage"] ?? "https://www.btklsby.go.id/images/placeholder/basic.png",
  );
}
