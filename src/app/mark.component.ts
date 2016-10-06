/// <reference path="../../typings/globals/rangy/index.d.ts" />
import {Component, OnInit} from '@angular/core';
import {ArticleService} from "./article.service";
import {Article} from "./article";

@Component({
  selector: 'mark-negation',
  templateUrl: './mark.component.html'
})
export class MarkComponent implements OnInit {
  article: Article;
  negPanelX: string = '0px';
  negPanelY: string = '0px';
  mouseUpEvent: MouseEvent = null;

  constructor(private heroService: ArticleService) {
  }

  ngOnInit(): void {
    this.article = this.heroService.getArticle();
  }

  isSelectedText(): boolean {
    return window.getSelection().toString() != "";
  }

  showNegationPanel(event: MouseEvent): void {
    event.preventDefault();
    this.mouseUpEvent = event;
    this.negPanelX = event.clientX + 'px';
    this.negPanelY = event.clientY + 'px';
  }

  addNegation(): void {
    this.addElementAroundSelection('span', 'negation-scope');
  }

  addNegationSource(): void {
    this.addElementAroundSelection('span', 'negation-signal');
  }

  addElementAroundSelection(elementName: string, className: string): void {
    let selection = rangy.getSelection();
    selection.expand('word', {wordOptions: {wordRegex:  /[a-zľščťžýáíéďúäňô0-9]+('[a-zľščťžýáíéďúäňô0-9]+)*/gi}});
    selection.trim();

    let element: Element = document.createElement(elementName);
    element.className = className;
    element.textContent = selection.toString();

    let range: RangyRange = selection.getAllRanges()[0];
    range.deleteContents();
    range.insertNode(element);
    this.updateContent();
  }

  updateContent(): void {
    this.article.currentContent = document.querySelector('#articleContent').innerHTML;
  }

  replaceTargetWithText(): void {
    let element: Element = this.mouseUpEvent.target as Element;
    element.parentNode.replaceChild(document.createTextNode(element.textContent), element);
    this.updateContent();
  }

  isNegationOrNegSource(): boolean {
    let target: Element = this.mouseUpEvent.target as Element;
    return this.mouseUpEvent != null &&
      (target.tagName.toLowerCase() == 'negation' || target.tagName.toLowerCase() == 'neg-source');
  }
}
