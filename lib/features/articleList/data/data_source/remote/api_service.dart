import 'package:floor/floor.dart';

import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../model/article.dart';
part 'api_service.g.dart';
@RestApi(baseUrl:APIBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/posts')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles();
}