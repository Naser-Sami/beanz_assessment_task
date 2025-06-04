import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/_config.dart' show TRadius;
import '/core/_core.dart' show BuildContextExtensions;
import '/features/_features.dart'
    show SearchBloc, SearchQueryChanged, EverythingQueryParameters;

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(TRadius.r12)),
      child: ColoredBox(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.4),
        child: TextField(
          key: const ValueKey('mainSearchBar'),
          controller: _searchController,
          onChanged: (value) {
            final query = value.trim();
            context.read<SearchBloc>().add(
              SearchQueryChanged(EverythingQueryParameters(q: query)),
            );
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            hintText: 'Search news...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
