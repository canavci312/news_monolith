import 'package:newsproject_monolith/data_layer/news_api/news_api.dart';
import 'package:newsproject_monolith/domain/global_news/i_global_news_repository.dart';
import 'package:newsproject_monolith/domain/global_news/news.dart';
import 'package:rake/rake.dart';

class GlobalNewsRepository implements IGlobalNewsRepository {
  final NewsApi _newsApi;
  GlobalNewsRepository(this._newsApi);

  @override
  Future<List<News>> fetchHeadlines() async {
    var newsDTOList = await _newsApi.fetchLatestNews();
    var news = newsDTOList
        ?.map((e) => News(
              e.source?.name ?? 'Unknown',
              e.title ?? 'No Title',
              e.description ?? 'No Description',
              e.url!,
              e.urlToImage ?? '',
              e.publishedAt!,
              e.content ?? 'No content',
              author: e.author,
            ))
        .toList();
    return news!;
  }

  @override
  Future<List<News>> fetchRelatedArticles(News article) async {
    final rake = Rake();
    String query = article.title + article.content;
    var ranking = rake.rank(query, minFrequency: 2);
    print(ranking);
    if (ranking.isNotEmpty) {
      var newsDTOList = await _newsApi.fetchRelatedArticles(ranking[0]);
      var news = newsDTOList
          ?.map((e) => News(
                e.source?.name ?? 'Unknown',
                e.title ?? 'No Title',
                e.description ?? 'No Description',
                e.url!,
                e.urlToImage ?? '',
                e.publishedAt!,
                e.content ?? 'No content',
                author: e.author,
              ))
          .toList();
      return news!;
    } else {
     return  fetchHeadlines();
    }
  }
}
