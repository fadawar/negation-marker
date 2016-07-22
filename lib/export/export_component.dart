import 'dart:async';
import 'dart:html';

import 'package:angular2/core.dart';

import 'package:negation_marker/article_service.dart';
import 'package:negation_marker/article.dart';

@Component(
    selector: 'export-component',
    templateUrl: 'export_component.html'
)
class ExportComponent {
  final ArticleService _articleService;
  Article article;

  ExportComponent(this._articleService);

  @override
  Future<Null> ngOnInit() async {
    article = await (_articleService.getArticle());
  }

  void exportToXML() {
    String text = '''
<?xml version="1.0" encoding="UTF-8"?>
<article>
  ${article.currentContent}
</article>''';
    Blob file = new Blob([text], 'text/xml');
    AnchorElement a = new AnchorElement(
        href: Url.createObjectUrlFromBlob(file));
    a.download = "file.xml";
    a.click();
  }
}