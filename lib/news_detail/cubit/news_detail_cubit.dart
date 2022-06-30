import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newsproject_monolith/domain/global_news/i_global_news_repository.dart';
import 'package:newsproject_monolith/domain/global_news/news.dart';

part 'news_detail_state.dart';
part 'news_detail_cubit.freezed.dart';

class NewsDetailCubit extends Cubit<NewsDetailState> {
  IGlobalNewsRepository _globalNewsRepository;
  NewsDetailCubit(this._globalNewsRepository, this._news)
      : super(NewsDetailState.initial(_news, []));

  final News _news;
  Future<void> fetchRelatedNews() async {
    List<News> relatedNews =
        await _globalNewsRepository.fetchRelatedArticles(_news);
    emit(state.copyWith(relatedNews: relatedNews));
  }
}
