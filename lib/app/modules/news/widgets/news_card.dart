import 'package:flutter/material.dart';
import 'package:microblogging/app/models/news_model.dart';

class NewsCard extends StatelessWidget {

  final NewsModel news;
  
  NewsCard({@required this.news});
  

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.user.name,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color(0xff7C4DFF)
              ),
            ),
            SizedBox(height: 7),
            Text(
              news.message.content,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300
              ),
            )
          ],
        ),
      ),
    );
  }
}