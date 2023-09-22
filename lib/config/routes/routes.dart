import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/features/GoogleSignIn/login_Screen.dart';
import 'package:untitled/features/UserProfile/UserProfile.dart';
import 'package:untitled/features/articleList/presentation/pages/HomeScreen/HomeScreen.dart';
import 'package:untitled/features/articleList/presentation/pages/HomeScreen/local_article.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const LoginScreen());

      case '/SavedArticles':
        return _materialRoute(SavedArticles());
      case'/Profile':
        return _materialRoute(UserProfile());
      case'/Home':
          return _materialRoute(HomeScreen());
        default:
        return _materialRoute(const HomeScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}