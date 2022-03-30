import 'package:flutter/material.dart';
import 'package:news_appp/model/articles.dart';
import 'package:news_appp/screen/detail_screen.dart';
import 'package:news_appp/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final Article article;
  const NewsItem(this.article, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(article)));
      },
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: EdgeInsets.only(
            bottom: edgeDetail
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Padding(
              padding:const EdgeInsets.only(left: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  article.urlToImage.toString(),
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
                child: SizedBox(
                  width: 220,
                  child: Column(
                    children: [
                      Text(
                        article.title.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: titleArticle.copyWith(
                            fontSize: 14
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          // ini date
                          Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined, size: 12,),
                              const SizedBox(width: 3,),
                              SizedBox(
                                width: 80,
                                child: Text(timeUntil(DateTime.parse(article.publishedAt.toString())),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: authorDateArticle.copyWith(
                                      fontSize: 12
                                  ),
                                ),
                              )
                            ],
                          ),
                          // ini author
                          Row(
                            children: [
                              const Icon(Icons.person, size: 12,),
                              const SizedBox(width: 3,),
                              SizedBox(
                                width: 80,
                                child: Text(article.author.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: authorDateArticle.copyWith(
                                      fontSize: 12
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  // buat fun untuk konversi tanggalnya
  String timeUntil(DateTime parse){
    return timeago.format(parse, allowFromNow: true, locale: 'en');
  }
}