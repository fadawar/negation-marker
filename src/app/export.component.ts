import {Component, OnInit} from '@angular/core'
import {Article} from "./article";
import {ArticleService} from "./article.service";

@Component({
  selector: 'export-article',
  templateUrl: './export.component.html'
})
export class ExportComponent implements OnInit {
  article: Article;
  url: string;
  date: string = new Date().toISOString().slice(0, 10);

  constructor(private heroService: ArticleService) {
  }

  ngOnInit(): void {
    this.article = this.heroService.getArticle();
  }

  exportToFile(): void {
    let link: HTMLAnchorElement = document.createElement('a');
    link.href = 'data:text/plain;charset=utf-8,' + encodeURIComponent(this.createXML());
    link.target = '_blank';
    link.setAttribute('download', 'article.xml');
    document.body.appendChild(link);
    link.click();
  }

  private createXML(): string {
    return `<?xml version="1.0" encoding="UTF-8"?>
<article>
  <meta>
    <url>${this.url}</url>
    <created>${this.date}</created>
  </meta>
  <content>
    ${this.article.currentContent}
  </content>
</article>`;
  }
}
