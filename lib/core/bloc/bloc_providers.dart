import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/_config.dart' show ThemeCubit;
import '/core/_core.dart' show sl;
import '/features/_features.dart'
    show NewsCubit, TopHeadlinesQueryParameters, SearchBloc;

final providers = [
  BlocProvider<ThemeCubit>(create: (context) => sl<ThemeCubit>()),
  BlocProvider<NewsCubit>(
    create: (context) =>
        sl<NewsCubit>()
          ..loadPage(baseParams: TopHeadlinesQueryParameters(page: 1)),
  ),
  BlocProvider<SearchBloc>(create: (context) => sl<SearchBloc>()),
];
