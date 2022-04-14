import 'package:flutter/material.dart';
import 'package:hello_world/model/article.dart';
import 'package:hello_world/screen/newspage.dart';
import 'package:hello_world/service/data_service.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.greenscene.co.id/wp-content/uploads/2020/10/Power-Rangers-696x497.jpg'))),
          width: 10,
          margin: EdgeInsets.all(5),
        ),
        title: Text(
          'Good Morning baybieh',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark),
            color: Colors.blue,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshoot) => snapshoot.data != null
        ? NewsPage(snapshoot.data as List<Article>)
        : Center(
          child: CircularProgressIndicator(),
        )
      ),
    );
  }
}
