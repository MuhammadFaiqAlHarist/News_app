import 'package:flutter/material.dart';
import 'package:hello_world/model/article.dart';
import 'package:hello_world/utils/utils.dart';
import 'package:hello_world/widget/carousel_widget.dart';
import 'package:hello_world/widget/tab_menu.dart';

class NewsPage extends StatefulWidget {
  final List<Article> article;

  NewsPage(this.article);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Breaking News',
              style: titleHome,
            ),
          ),
          CarouselWidget(widget.article),
          TabBarMenu(widget.article)
        ],
      ),
    );
  }
}
