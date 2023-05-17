import { Component } from '@angular/core';
import {HttpClient} from '@angular/common/http';



@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage{
  country:any
  nome:any
  resultSearch:any=[]
  constructor(private http:HttpClient) {

  }

  pesquisaUni(){
   let URL= `http://universities.hipolabs.com/search?name=${this.nome}&country=${this.country}`; 
    this.http.get(URL).subscribe((response)=>{
      this.resultSearch=response;
    })
  }
}
