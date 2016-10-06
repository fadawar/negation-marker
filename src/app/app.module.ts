import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {FormsModule} from '@angular/forms';
import {HttpModule} from '@angular/http';

import {AppComponent} from './app.component';
import {NegationMarkerRoutingModule} from './app-routing.module';
import {PasteComponent} from './paste.component';
import {ArticleService} from "./article.service";
import {MarkComponent} from "./mark.component";
import {ExportComponent} from "./export.component";

@NgModule({
  declarations: [
    AppComponent,
    PasteComponent,
    MarkComponent,
    ExportComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    NegationMarkerRoutingModule
  ],
  providers: [
    ArticleService
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
}
