import {Component, OnInit} from '@angular/core';
import {Router} from "@angular/router";
import {ArticleService} from "./article.service";
import {Article} from "./article";


@Component({
  selector: 'paste-article',
  templateUrl: './paste.component.html'
})
export class PasteComponent implements OnInit {
  article: Article;

  constructor(
    private router: Router,
    private heroService: ArticleService
  ){}

  ngOnInit(): void {
    this.article = this.heroService.getArticle();
  }

  loadPastedText(content: string): void {
    this.article.replaceContentWith(content);
    this.router.navigate(['/mark']);
  }
}
