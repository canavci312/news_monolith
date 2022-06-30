import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsproject_monolith/home_page/view/widgets/news_search_input.dart';
import 'package:newsproject_monolith/home_page/view/widgets/news_tile.dart';
import 'package:newsproject_monolith/news_detail/view/news_detail_page.dart';

import '../home_page.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text("Today's Headlines")),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            success: (list) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const NewsSearchInput(),
                  if (list.isNotEmpty) ...[
                    Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            
                              onTap: () => Navigator.of(context)
                                  .push<MaterialPageRoute>(MaterialPageRoute(
                                      builder: (context) => NewsDetailPage(list[index]))),
                              child: NewsTile(list[index]));
                        },
                      ),
                    )
                  ] else
                    const Text('No result :('),
                ],
              );
            },
            error: () => const Center(child: Text('Something went wrong')),
          );
        },
      ),
    );
  }
}
