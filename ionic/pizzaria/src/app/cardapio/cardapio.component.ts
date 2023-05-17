import { Component, OnInit } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {NavigationExtras, Router} from '@angular/router';

const URL='https://raw.githubusercontent.com/esensato/mobile-2022-01/main/services/lista-pizza.json';


@Component({
  selector: 'app-cardapio',
  templateUrl: './cardapio.component.html',
  styleUrls: ['./cardapio.component.scss'],
})
export class CardapioComponent implements OnInit {
  cardapio:any=[];
  pizzaSelect:any;
  bebidaSelect:any;
  ocultarCardapio:boolean=false;

  constructor(private http:HttpClient, private router:Router) {

  }

  selPizza(pizza){
    this.pizzaSelect=pizza;
    this.ocultarCardapio=true;
  }

  selBebida(bebida){
    this.bebidaSelect=bebida;
    let navExtras: NavigationExtras = {
      state: {
      pizzaSelect: this.pizzaSelect,
      bebidaSelect: this.bebidaSelect
      }
      };
    this.router.navigate(['pizzaria/pedido'],navExtras);
  }

  ngOnInit() {
    this.http.get(URL).subscribe((response) => {
      this.cardapio=response;
    });
  }


}
