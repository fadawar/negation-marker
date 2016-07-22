import 'dart:core';

class Article {
  String originalContent;
  String currentContent;
  int wordCount;
  int sentenceCount;

  Article(String sourceText) {
    initialize(sourceText);
  }

  void initialize(String sourceText) {
    currentContent = originalContent = sourceText.trim();
    wordCount = currentContent.split(" ").length;

    RegExp exp = new RegExp(r"\w[.?!](\s|$)");  // define regex for sentence
    sentenceCount = exp.allMatches(currentContent).length;
  }

  void replaceContentWith(String text) {
    initialize(text);
  }
}