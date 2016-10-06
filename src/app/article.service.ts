import {Injectable} from '@angular/core'

import {Article} from './article'

@Injectable()
export class ArticleService {
  article: Article = new Article("");

  getArticle(): Article {
    return this.article;
  }
}
