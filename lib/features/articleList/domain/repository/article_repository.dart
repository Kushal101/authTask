import '../../../../core/resources/data_state.dart';
import '../entities/articles.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntity>>> getArticles();

  // Database methods
  Future < List < ArticleEntity >> getSavedArticles();
  Future < void > saveArticle(ArticleEntity article);

}