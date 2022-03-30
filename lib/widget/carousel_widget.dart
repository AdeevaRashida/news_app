import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_appp/model/articles.dart';
import 'package:news_appp/screen/detail_screen.dart';
import 'package:news_appp/utils/utils.dart';

class CarouselWidget extends StatefulWidget {
  final List<Article> articleList ;
  const CarouselWidget(this.articleList, {Key? key}) : super(key: key);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late List<Widget> imageSlider ;

  @override
  void initState() {
    imageSlider = widget.articleList.map((article) => GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(article)));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage.toString())
                  )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin:  Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [0.1, 0.9],
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.white.withOpacity(0.1)
                      ]
                  )
              ),
            ),
            Positioned(
                bottom: 30,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(article.title.toString() , style: titleArticleHeadline,),
                      const SizedBox(height: 10,),
                      Text(article.author.toString(), style: authorDateArticle.copyWith(
                          fontSize: 10 , color:  Colors.white
                      ),)
                    ],
                  ),
                )
            )
          ],
        ),
      ) ,
    )).toList();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: imageSlider,
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1,
        )
    );
  }
}