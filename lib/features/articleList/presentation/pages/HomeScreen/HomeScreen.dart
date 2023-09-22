import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled/features/UserProfile/UserProfile.dart';
import 'package:untitled/features/articleList/presentation/pages/HomeScreen/local_article.dart';

import '../../../../InternetConnectivity/networkStatus.dart';
import '../../../domain/entities/articles.dart';
import '../../bloc/article/local/local_article_bloc.dart';
import '../../bloc/article/local/local_article_event.dart';
import '../../bloc/article/remote/remote_article_bloc.dart';
import '../../bloc/article/remote/remote_article_state.dart';
import '../../widgets/article_tile.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<NetworkStatus>(
        initialData: NetworkStatus.Online,
        create: (context) =>
        NetworkStatusService().networkStatusController.stream,
        child: NetworkAwareWidget(
        onlineChild: Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody() ,
          floatingActionButton: FloatingActionButton(onPressed: (){_onShowSavedArticlesViewTapped(context);},),
    ), offlineChild:Container()));
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Articles',
        style: TextStyle(
            color: Colors.black
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () =>Navigator.pushNamed(context, '/Profile'),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.person, color: Colors.black),
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc,RemoteArticlesState> (
      builder: (_,state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemBuilder: (context,index){

              return ArticleWidget(
                article: state.articles![index] ,
                onArticlePressed: (article) => _onSavedArticle(context, article)
              );
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      },
    );
  }



  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
  void _onSavedArticle(BuildContext context,ArticleEntity article) {
    BlocProvider.of<LocalArticleBloc>(context).add(SaveArticle(article));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black,
        content: Text('Article saved successfully.'),
      ),
    );
  }
}