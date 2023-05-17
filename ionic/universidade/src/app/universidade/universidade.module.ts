import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PesquisaComponent } from '../pesquisa/pesquisa.component';
import {Routes,RouterModule} from '@angular/router';

const routes: Routes = [{
  path:'pesquisa',
  component:PesquisaComponent
}];


@NgModule({
  declarations: [PesquisaComponent],
  imports: [
    CommonModule,RouterModule.forRoot(routes)
  ],
  exports: [
    PesquisaComponent
  ]
})
export class UniversidadeModule { }
