import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/model/article.dart';
import 'package:hello_world/screen/detailpage.dart';
import 'package:hello_world/utils/utils.dart';

class CarouselWidget extends StatefulWidget {
  final List<Article> articleList;

  CarouselWidget(this.articleList);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late List<Widget> imageSliders;

  @override
  void initState() {
    //disini kita ingin membbuat widget sendiri bernama imageSlider
    //kemudian imageSlider tersebut akan berisikan list dari articleList

    imageSliders = widget.articleList.map((article) {
      return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(article: article)));
          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: NetworkImage(article.urlToImage),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [
                            0.1,
                            0.9
                          ],
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.white.withOpacity(0.1)
                          ])),
                ),
                Positioned(
                  bottom: 30,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title,
                          style: titleArticleHeadline.copyWith(fontSize: 10),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          article.author,
                          style: authorDateArticleHeadline.copyWith(fontSize: 10)
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
    }).toList();
    //TODO: implement initState
  }

  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1
        ),
      ),
    );
  }
}