import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/features/daily_news/domain/entities/article.dart';
import 'package:myapp/src/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:myapp/src/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:myapp/src/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  BlocBuilder<RemoteArticleBloc, RemoteArticleState> _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RemoteArticleError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        return ListView.builder(
          itemCount: state.articles!.length,
          itemBuilder: (context, index) {
            return ArticleWidget(article: state.articles![index], onArticlePressed:  (article) => _onArticlePressed(context, article),);
          },
        );
        
      },
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
          'Daily News',
          style: TextStyle(
            color: Colors.black
          ),
        ),
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    context.pushNamed("ArticleDetails", extra: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    context.pushNamed("SavedArticles");
  }
  
}
