import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/_core.dart' show BuildContextExtensions;
import '/features/_features.dart'
    show
        NewsCubit,
        NewsState,
        NewsLoading,
        NewsLoaded,
        TopHeadlinesQueryParameters;
import '/shared/_shared.dart' show TextWidget, CustomPadding;

class PagesButtons extends StatefulWidget {
  const PagesButtons({super.key});

  @override
  State<PagesButtons> createState() => _PagesButtonsState();
}

class _PagesButtonsState extends State<PagesButtons> {
  final _currentPage = ValueNotifier<int>(1);

  void _goToPage(int page) {
    _currentPage.value = page;
    context.read<NewsCubit>().loadPage(
      page: page,
      append: false,
      baseParams: TopHeadlinesQueryParameters(page: page),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final cubit = context.read<NewsCubit>();
    final state = cubit.state;
    if (state is NewsLoaded) {
      _currentPage.value = state.currentPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      buildWhen: (prev, curr) => curr is NewsLoaded || curr is NewsLoading,
      builder: (context, state) {
        if (state is! NewsLoaded) return const SizedBox.shrink();

        final cubit = context.read<NewsCubit>();
        final totalPages = cubit.totalPages;

        return CustomPadding(
          child: ValueListenableBuilder<int>(
            valueListenable: _currentPage,
            builder: (context, currentPage, _) {
              final List<Widget> buttons = [];

              final startPage = (currentPage - 1).clamp(1, totalPages - 2);
              final endPage = (startPage + 2).clamp(3, totalPages);

              // Show ... before
              if (startPage > 1) {
                buttons.add(_ellipsis());
              }

              for (int page = startPage; page <= endPage; page++) {
                buttons.add(_pageButton(page, currentPage));
              }

              // Show ... after
              if (endPage < totalPages) {
                buttons.add(_ellipsis());
              }

              // Add "Next" button
              if (currentPage < totalPages) {
                buttons.add(_nextButton(currentPage + 1));
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: buttons),
              );
            },
          ),
        );
      },
    );
  }

  Widget _pageButton(int page, int currentPage) {
    final isActive = currentPage == page;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isActive
                ? context.colorScheme.primary
                : context.colorScheme.surface,
          ),
          foregroundColor: WidgetStateProperty.all(
            isActive
                ? context.colorScheme.onPrimary
                : context.colorScheme.onSurface,
          ),
        ),
        onPressed: () => _goToPage(page),
        child: TextWidget('$page'),
      ),
    );
  }

  Widget _ellipsis() => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 6),
    child: Text('...'),
  );

  Widget _nextButton(int page) => Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: OutlinedButton(
      onPressed: () => _goToPage(page),
      child: const TextWidget('Next'),
    ),
  );
}
