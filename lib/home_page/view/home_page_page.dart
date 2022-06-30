import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsproject_monolith/domain/global_news/i_global_news_repository.dart';
import 'package:newsproject_monolith/locator.dart';

import '../home_page.dart';
import 'home_page_view.dart';

class HomePagePage extends StatelessWidget {
  const HomePagePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomePageCubit(getIt<IGlobalNewsRepository>())..fetchHeadlines(),
      child: const HomePageView(),
    );
  }
}
