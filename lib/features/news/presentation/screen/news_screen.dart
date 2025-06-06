import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/_features.dart' show SearchBloc, SearchState, SearchInitial;
import '/shared/_shared.dart' show MainAppBar;
import 'news_body/news_body.dart';
import 'searched_body/searched_news_body.dart';

class NewsScreen extends StatefulWidget {
  static const routePath = '/news';
  static const String routeName = 'News';
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        setState(() {
          _isSearching = state is! SearchInitial;
        });
      },
      child: Scaffold(
        appBar: const MainAppBar(),
        body: _isSearching ? const SearchedNewsBody() : const NewsScreenBody(),
      ),
    );
  }
}
