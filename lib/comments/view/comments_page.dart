import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsproject_monolith/comments/cubit/comments_cubit.dart';
import 'package:newsproject_monolith/comments/view/comments_view.dart';
import 'package:newsproject_monolith/domain/comments/i_comments_repository.dart';

import '../../locator.dart';

class CommentsPage extends StatelessWidget {
  final String url;
  const CommentsPage(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CommentsCubit(url, getIt<ICommentsRepository>())..fetchComments(),
      child: CommentsView(),
    );
  }
}
