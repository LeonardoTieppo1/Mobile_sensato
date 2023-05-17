import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CardapioComponent } from '../cardapio/cardapio.component';
import { PedidoComponent } from '../pedido/pedido.component';
import { Routes, RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';

const routes: Routes = [{
  path:'cardapio',
  component: CardapioComponent
},
  {
  path:'pedido',
  component:PedidoComponent
  }
];

@NgModule({
  declarations: [CardapioComponent,PedidoComponent],//juntando internamente no modulo
  imports: [
    CommonModule, RouterModule.forChild(routes),HttpClientModule//são outros modulos que vão juntar com o projeto, lembrar de importar os componentes utilizados
  ],
  exports: [
    CardapioComponent,PedidoComponent//componentes externos ou internos
  ]
})
export class PizzariaModule { }
