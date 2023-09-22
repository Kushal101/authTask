import 'package:floor/floor.dart';

import '../../domain/entities/articles.dart';

@Entity(tableName: 'article',primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int ? id,
    int ? userId,
    String ? title,
    String ? body,

  }): super(
    id: id,
    userId: userId,
    title: title,
    body: body,

  );

  factory ArticleModel.fromJson(Map < String, dynamic > map) {
    return ArticleModel(
      userId: map['userId'] ?? "",
      title: map['title'] ?? "",
      body: map['body'] ?? "",

    );
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
        id: entity.id,
        userId: entity.userId,
        title: entity.title,
        body:entity.body,
    );
  }
}