import 'package:flutter/material.dart';
import 'package:hello_world/model/article.dart';
import 'package:hello_world/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailPage extends StatefulWidget {
  final Article article;
  DetailPage({required this.article});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.article.urlToImage,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 330,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24),
                        Text(
                          widget.article.title,
                          style: titleArticle.copyWith(fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.account_circle,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 10),
                                Text(
                                  widget.article.author,
                                  style:
                                      authorDateArticle.copyWith(fontSize: 14),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 24,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  timeUntill(DateTime.parse(
                                    widget.article.publishedAt,
                                  )),
                                  style:
                                      authorDateArticle.copyWith(fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          widget.article.content,
                          style: detailArticle.copyWith(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0,10),
                          blurRadius: 50
                        )
                      ]
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: (){ },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0,10),
                          blurRadius: 50
                        )
                      ],
                    ),
                    child: IconButton(
                       icon: Icon(Icons.bookmark_border_rounded),
                      onPressed: (){},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String timeUntill(DateTime parse) {
  return timeago.format(parse, allowFromNow: true, locale: 'en');
}
