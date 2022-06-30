import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsproject_monolith/domain/global_news/i_global_news_repository.dart';
import 'package:newsproject_monolith/domain/global_news/news.dart';
import 'package:newsproject_monolith/locator.dart';
import 'package:newsproject_monolith/news_detail/cubit/news_detail_cubit.dart';
import 'package:newsproject_monolith/news_detail/view/news_detail_view.dart';

class NewsDetailPage extends StatelessWidget {
  final News _news;
  const NewsDetailPage(this._news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsDetailCubit(getIt<IGlobalNewsRepository>(), this._news)
            ..fetchRelatedNews(),
      child: NewsDetailView(),
    );
  }
}
