import '/config/_config.dart' show ThemeCubit;
import '/core/_core.dart' show sl;
import '/features/_features.dart'
    show
        NewsCubit,
        GetTopHeadlinesNewsUseCase,
        SearchBloc,
        GetSearchedNewsUseCase;

void initControllers() {
  _theme();
  _news();
}

void _theme() {
  sl.registerFactory<ThemeCubit>(ThemeCubit.new);
}

void _news() {
  sl.registerFactory<NewsCubit>(
    () => NewsCubit(sl<GetTopHeadlinesNewsUseCase>()),
  );

  sl.registerFactory<SearchBloc>(
    () => SearchBloc(sl<GetSearchedNewsUseCase>()),
  );
}
