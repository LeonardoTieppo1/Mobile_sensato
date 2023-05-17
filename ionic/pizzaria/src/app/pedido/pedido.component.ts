import { Component, OnInit } from '@angular/core';
import { ActivatedRoute,Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';


@Component({
  selector: 'app-pedido',
  templateUrl: './pedido.component.html',
  styleUrls: ['./pedido.component.scss'],
})
export class PedidoComponent implements OnInit {

  pizzaSelect:any;
  bebidaSelect:any;
  total: number=0.0;
  quantidade: number=0;
  nome:string='';

  constructor(private route:ActivatedRoute, private router: Router, private http:HttpClient) { 
    this.route.queryParams.subscribe(params=>{
      if(this.router.getCurrentNavigation().extras.state){
        this.pizzaSelect= this.router.getCurrentNavigation().extras.state.pizzaSelect;
        this.bebidaSelect= this.router.getCurrentNavigation().extras.state.bebidaSelect;
        this.total=parseFloat(this.pizzaSelect.preco)+parseFloat(this.bebidaSelect.preco);
      }
    })
  }
  recalcular(valor){
    this.quantidade=valor;
    this.total=this.quantidade*parseFloat(this.bebidaSelect.preco)+parseFloat(this.pizzaSelect.preco);
    console.log(this.quantidade,valor);
  }
  queijoExtra(valor){
    console.log(valor.checked);
    if(valor.checked){
      this.total+=10;
    }else{
      this.total-=10;
    }
  }
  enviarPedido(){
    const URL= "https://us-south.functions.appdomain.cloud/api/v1/web/f8bfe5a1-901e-46cf-be4c-0207c5625859/default/GravarPedido";
    this.http.post(URL,{pedidos:{pizza:this.pizzaSelect,bebida:this.bebidaSelect,quantidade:this.quantidade,total:this.total}}).subscribe((response)=>{
      //function api key, cloudant
      //codigo: url da function.
    })
  }

  ngOnInit() {}

}