import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/_config.dart' show ResponsiveLayout;
import '/features/_features.dart'
    show
        NewsCubit,
        NewsState,
        NewsLoading,
        NewsError,
        NewsLoaded,
        MobileNewsScreen,
        TabletNewsScreen,
        WebNewsScreen;

class NewsScreenBody extends StatelessWidget {
  const NewsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    log('News Body Build');

    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is NewsError) {
          return Center(child: Text('Error: ${state.error}'));
        }

        if (state is NewsLoaded) {
          final articles = state.news.articles;

          return ResponsiveLayout(
            smallLayout: MobileNewsScreen(articles: articles),
            mediumLayout: TabletNewsScreen(articles: articles),
            largeLayout: WebNewsScreen(articles: articles),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
