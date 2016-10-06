import 'dart:async';
import 'dart:html';
import 'package:intl/intl.dart';

import 'package:angular2/core.dart';

import 'package:negation_marker/article_service.dart';
import 'package:negation_marker/article.dart';

@Component(
    selector: 'export-component',
    templateUrl: 'export_component.html'
)
class ExportComponent implements OnInit {
  final ArticleService _articleService;
  Article article;
  String filename = "file.xml";
  String url;
  String date = new DateFormat('yyyy-MM-dd').format(new DateTime.now());

  ExportComponent(this._articleService);

  @override
  Future<Null> ngOnInit() async {
    article = await (_articleService.getArticle());
  }

  void exportToXML() {
    String text = '''
<?xml version="1.0" encoding="UTF-8"?>
<article>
  <meta>
    <url>$url</url>
    <created>$date</created>
  </meta>
  ${article.currentContent}
</article>''';
    Blob file = new Blob([text], 'text/xml');
    AnchorElement a = new AnchorElement(
        href: Url.createObjectUrlFromBlob(file));
    a.download = filename;
    a.click();
  }
}