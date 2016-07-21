import 'dart:html';
import 'dart:js' as js;

import 'package:angular2/core.dart';

@Component(
    selector: 'main-app',
    templateUrl: 'app_component.html'
)
class AppComponent {
  bool pastingText = false;
  String content = '''
  In JavaScript, when an object is passed to a function expecting a string (like window.alert() or document.write()), the object's toString() method is called and the returned value is passed to the function. This can make the object appear to be a string when used with other functions when it is really an object with properties and methods. In the above example, selObj.toString() is automatically called when it is passed to window.alert(). However, attempting to use a JavaScript String property or method such as length or substr directly on a Selection object will result in an error if it does not have that property or method and may return unexpected results if it does. To use a Selection object as a string, call its toString() method directly:
  ''';
  String negPanelX = '0px';
  String negPanelY = '0px';
  MouseEvent mouseUpEvent = null;

  void showPasteText() {
    pastingText = true;
  }

  void loadPastedText(String text) {
    content = text;
    pastingText = false;
  }

  void showNegationPanel(event) {
    event.preventDefault();
    mouseUpEvent = event;
    negPanelX = '${event.clientX}px';
    negPanelY = '${event.clientY}px';
  }

  bool isSelectedText() {
    Selection sel = window.getSelection();
    return sel.toString() != "";
  }

  void addNegation() {
    addElementAroundSelection('negation');
  }

  void addNegationSource() {
    addElementAroundSelection('neg-source');
  }

  void addElementAroundSelection(String elementName) {
    // snap selection to word
    js.context['rangy'].callMethod('getSelection').callMethod('expand', ['word']);
    js.context['rangy'].callMethod('getSelection').callMethod('trim');

    Selection sel = window.getSelection();
    Element element = window.document.createElement(elementName);
    element.text = sel.toString();

    Range range = sel.getRangeAt(0);
    range.deleteContents();
    range.insertNode(element);
  }

  void replaceTargetWithText() {
    Element el = mouseUpEvent.target;
    String text = el.text;
    el.replaceWith(new Text(text));
  }

  bool isNegationOrNegSource() {
    Element target = mouseUpEvent.target;
    return
      mouseUpEvent != null &&
      (target.tagName.toLowerCase() == 'negation' ||
      target.tagName.toLowerCase() == 'neg-source');
  }
}