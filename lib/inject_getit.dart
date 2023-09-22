import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/articleList/data/data_source/local/app_database.dart';
import 'features/articleList/data/data_source/remote/api_service.dart';
import 'features/articleList/data/repository/article_repo_implement.dart';
import 'features/articleList/domain/repository/article_repository.dart';
import 'features/articleList/domain/usecase/get_article.dart';
import 'features/articleList/domain/usecase/get_saved_article.dart';
import 'features/articleList/domain/usecase/save_article.dart';
import 'features/articleList/presentation/bloc/article/local/local_article_bloc.dart';
import 'features/articleList/presentation/bloc/article/remote/remote_article_bloc.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<ApiService>(ApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(sl(),sl())
  );

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(sl())
  );

  sl.registerSingleton<GetSavedArticleUseCase>(
      GetSavedArticleUseCase(sl())
  );
  sl.registerSingleton<SaveArticleUseCase>(
      SaveArticleUseCase(sl())
  );




  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(
          ()=> RemoteArticlesBloc(sl())
  );

  sl.registerFactory<LocalArticleBloc>(
          ()=> LocalArticleBloc(sl(),sl())
  );


}