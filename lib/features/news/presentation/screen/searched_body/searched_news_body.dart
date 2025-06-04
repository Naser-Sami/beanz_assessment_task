import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/_config.dart' show ResponsiveLayout;
import '/features/_features.dart'
    show
        SearchBloc,
        SearchState,
        SearchLoaded,
        SearchError,
        MobileNewsScreen,
        TabletNewsScreen,
        WebNewsScreen;

class SearchedNewsBody extends StatelessWidget {
  const SearchedNewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    log('Search News Body Build');

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchError) {
          return Center(child: Text('Error: ${state.message}'));
        }

        if (state is SearchLoaded) {
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
