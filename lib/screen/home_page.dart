import 'package:flutter/material.dart';
import 'package:news_appp/model/articles.dart';
import 'package:news_appp/service/data_service.dart';
import 'package:news_appp/utils/utils.dart';

import 'newspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
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
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/474x/6f/07/54/6f075499b1731f3770a412928bbb4b53.jpg'
                    ))
            ),
            width: 10,
            margin: const EdgeInsets.all(5),
          ),
          title: Text('Good Morning', style: titleArticle.copyWith(
              fontSize: 20
          ),),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark, color: Colors.blue,)
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: news.getNews(),
            builder: (context, snapshot) => snapshot.data != null
                ? NewsPage(snapshot.data as List<Article>)
                : const Center(child: CircularProgressIndicator())
        )
    );
  }
}