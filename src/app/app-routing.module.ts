import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import {PasteComponent} from './paste.component';
import {MarkComponent} from "./mark.component";
import {ExportComponent} from "./export.component";

const routes: Routes = [
  {
    path: '',
    redirectTo: '/paste',
    pathMatch: 'full'
  },
  {
    path: 'paste',
    component: PasteComponent
  },
  {
    path: 'mark',
    component: MarkComponent
  },
  {
    path: 'export',
    component: ExportComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
  providers: []
})
export class NegationMarkerRoutingModule { }
