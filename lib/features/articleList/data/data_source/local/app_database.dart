import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import '../../model/article.dart';
import 'DAO.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO;
}