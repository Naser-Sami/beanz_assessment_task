import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/_config.dart' show TPadding;
import '/features/_features.dart'
    show Article, NewsLoaded, NewsCubit, TopHeadlinesQueryParameters;
import '/shared/_shared.dart' show ArticleCardComponent;

class MobileNewsListView extends StatefulWidget {
  const MobileNewsListView({super.key, required this.articles});
  final List<Article> articles;

  @override
  State<MobileNewsListView> createState() => _MobileNewsListViewState();
}

class _MobileNewsListViewState extends State<MobileNewsListView> {
  final _controller = ScrollController();
  final _showLoading = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  bool _isLoading = false;

  void _onScroll() {
    if (_controller.position.pixels >=
            _controller.position.maxScrollExtent - 200 &&
        !_isLoading) {
      final cubit = context.read<NewsCubit>();
      final state = cubit.state;

      if (state is NewsLoaded) {
        final page = state.currentPage + 1;
        if (page <= state.totalPages) {
          _isLoading = true;
          _showLoading.value = true;

          cubit
              .loadPage(
                page: page,
                baseParams: TopHeadlinesQueryParameters(page: page),
                append: true,
              )
              .then((_) {
                _isLoading = false;
                _showLoading.value = false;
              });
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        key: const PageStorageKey<String>('mobile_news_list_view'),
        controller: _controller,
        padding: const EdgeInsets.symmetric(horizontal: TPadding.p16),
        itemCount: widget.articles.length + 1,
        separatorBuilder: (_, _) => const SizedBox(height: TPadding.p24),
        itemBuilder: (context, index) {
          if (index < widget.articles.length) {
            final article = widget.articles[index];
            return ArticleCardComponent(
              key: ValueKey(article.uuid),
              article: article,
            );
          } else {
            return ValueListenableBuilder<bool>(
              valueListenable: _showLoading,
              builder: (_, isLoading, __) {
                return isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(TPadding.p16),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : const SizedBox.shrink();
              },
            );
          }
        },
      ),
    );
  }
}
