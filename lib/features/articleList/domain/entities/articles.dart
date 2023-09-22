import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable{
  final int ? id;
  final int? userId;
  final String ? title;
  final String ? body;

  const ArticleEntity({
    this.id,
    this.userId,
    this.title,
    this.body,

  });

  @override
  List < Object ? > get props {
    return [
      id,
      userId,
      title,
      body

    ];
  }
}