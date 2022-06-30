import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsproject_monolith/comments/view/comments_page.dart';
import 'package:newsproject_monolith/news_detail/cubit/news_detail_cubit.dart';
import 'package:newsproject_monolith/news_detail/view/widgets/related_news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsDetailCubit, NewsDetailState>(
      builder: (context, state) {
        return state.when(initial: (news, relatedNews) {
          return Scaffold(
              appBar: AppBar(title: Text(news.title)),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(news.content),
                      RelatedNews(relatedNews),
                      CommentsPage(news.url),
                    ],
                  ),
                ),
              ));
        });
      },
    );
  }
}
