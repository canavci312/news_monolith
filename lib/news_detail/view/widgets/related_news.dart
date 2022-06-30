import 'package:flutter/material.dart';
import 'package:newsproject_monolith/domain/global_news/news.dart';
import 'package:newsproject_monolith/home_page/view/widgets/news_tile.dart';
import 'package:newsproject_monolith/news_detail/view/news_detail_page.dart';

class RelatedNews extends StatelessWidget {
  const RelatedNews(this.relatedNews, {super.key});

  final List<News> relatedNews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: relatedNews.length > 3 ? 3 : relatedNews.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.of(context).push<MaterialPageRoute>(
            MaterialPageRoute(
              builder: (context) => NewsDetailPage(relatedNews[index]),
            ),
          ),
          child: NewsTile(relatedNews[index]),
        );
      },
    );
  }
}
