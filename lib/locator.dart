import 'package:get_it/get_it.dart';
import 'package:newsproject_monolith/data_layer/news_api/comments_repository.dart';
import 'package:newsproject_monolith/data_layer/news_api/global_news_repository.dart';
import 'package:newsproject_monolith/data_layer/news_api/news_api.dart';
import 'package:newsproject_monolith/domain/comments/i_comments_repository.dart';
import 'package:newsproject_monolith/domain/global_news/i_global_news_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt
    ..registerLazySingleton<NewsApi>(() => (NewsApi()))
    ..registerLazySingleton<IGlobalNewsRepository>(
      () => GlobalNewsRepository(getIt()),
    )
    ..registerLazySingleton<ICommentsRepository>(
        () => FirestoreCommentsRepository());
}
