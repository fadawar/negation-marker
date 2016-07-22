import 'dart:html';
import 'dart:js' as js;
import 'dart:async';

import 'package:angular2/core.dart';

import 'package:negation_marker/article_service.dart';
import 'package:negation_marker/article.dart';

@Component(
    selector: 'edit-article',
    templateUrl: 'edit_component.html'
)
class EditComponent implements OnInit {
  final ArticleService _articleService;
  Article article;
  String negPanelX = '0px';
  String negPanelY = '0px';
  MouseEvent mouseUpEvent = null;
  String bla = 'ahoj2';

  EditComponent(this._articleService);

  @override
  Future<Null> ngOnInit() async {
    article = await (_articleService.getArticle());
  }

  String getCurrentContent() {
    if (article == null) {
      return "";
    }
    return article.currentContent;
  }

  bool isSelectedText() {
    Selection sel = window.getSelection();
    return sel.toString() != "";
  }

  void showNegationPanel(event) {
    event.preventDefault();
    mouseUpEvent = event;
    negPanelX = '${event.clientX}px';
    negPanelY = '${event.clientY}px';
  }

  void addNegation() {
    addElementAroundSelection('negation');
  }

  void addNegationSource() {
    addElementAroundSelection('neg-source');
  }

  void addElementAroundSelection(String elementName) {
    // snap selection to word
    js.context['rangy'].callMethod('getSelection').callMethod(
        'expand', ['word']);
    js.context['rangy'].callMethod('getSelection').callMethod('trim');

    Selection sel = window.getSelection();
    Element element = window.document.createElement(elementName);
    element.text = sel.toString();

    Range range = sel.getRangeAt(0);
    range.deleteContents();
    range.insertNode(element);
    updateContent();
  }

  void updateContent() {
    Element el = querySelector('#articleContent');
    article.currentContent = el.innerHtml;
  }

  void replaceTargetWithText() {
    Element el = mouseUpEvent.target;
    String text = el.text;
    el.replaceWith(new Text(text));
    updateContent();
  }

  bool isNegationOrNegSource() {
    Element target = mouseUpEvent.target;
    return
      mouseUpEvent != null &&
          (target.tagName.toLowerCase() == 'negation' ||
              target.tagName.toLowerCase() == 'neg-source');
  }
}