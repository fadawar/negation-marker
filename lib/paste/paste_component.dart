import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:negation_marker/article_service.dart';
import 'package:negation_marker/article.dart';

@Component(
    selector: 'paste-article',
    templateUrl: 'paste_component.html'
)
class PasteComponent implements OnInit {
  final ArticleService _articleService;
  final Router _router;
  Article article;

  PasteComponent(this._articleService, this._router);

  @override
  Future<Null> ngOnInit() async {
    article = await (_articleService.getArticle());
  }

  void loadPastedText(String text) {
    article.replaceContentWith(text);
    _router.navigate(['Edit']);
  }
}