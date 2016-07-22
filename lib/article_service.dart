import 'dart:async';

import 'package:angular2/core.dart';

import 'article.dart';

@Injectable()
class ArticleService {
  Article article = new Article("");

  Future<Article> getArticle() async => article;
}