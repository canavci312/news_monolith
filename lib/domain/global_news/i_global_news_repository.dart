import 'news.dart';

abstract class IGlobalNewsRepository {
  Future<List<News>> fetchHeadlines();
    Future<List<News>> fetchRelatedArticles(News news);

}
