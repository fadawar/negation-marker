export class Article {
  public static readonly CHARS_PER_NORMOPAGE: number = 1800;
  originalContent: string;
  currentContent: string;

  constructor(text: string) {
    this.initialize(text);
  }

  initialize(sourceText: string): void {
    this.originalContent = sourceText.trim();
    this.currentContent = this.emptyLinesToBr(this.originalContent);
  }

  replaceContentWith(text: string): void {
    this.initialize(text);
  }

  private emptyLinesToBr(content: string) {
    return content.replace(/^\s*\n/gm, "<br>\n")
  }

  sentenceCount(): number {
    let sentenceRegex = /\w[.?!](\s|$)/g;
    return (this.originalContent.match(sentenceRegex) || []).length;
  }

  wordsCount(): number {
    return this.originalContent.split(" ").length;
  }

  normoPagesCount(): string {
    let normoPages = this.originalContent.length / Article.CHARS_PER_NORMOPAGE;
    return normoPages.toFixed(2);
  }
}
