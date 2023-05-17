import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'pizzaria',
    loadChildren: () => import('./pizzaria/pizzaria.module').then( m => m.PizzariaModule)
  },
  {
    path: '',
    redirectTo: 'pizzaria/cardapio',
    pathMatch: 'full'
  },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
