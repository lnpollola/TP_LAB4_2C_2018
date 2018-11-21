
import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { CaptchaService } from '../services/captcha.service';
import { timeout } from 'q';


@Component({
  selector: 'app-captcha-propio',
  templateUrl: './captcha-propio.component.html',
  styleUrls: ['./captcha-propio.component.css']
})
export class CaptchaPropioComponent implements OnInit {

  @Output() lanzador = new EventEmitter();
  
  colorPedido: string;
  ok;
  respuesta: any;
  spinner=false;

 

  constructor(private httpCaptcha: CaptchaService) {
    this.AsignarColor()
   }

  Spinner()
  {
  this.spinner= !this.spinner;
  console.log(this.spinner);
  }

  AsignarColor()
  {

    let numero = Math.round((Math.random() * 3));
    console.log(numero);
    if(numero == 1 )
    {
      this.colorPedido="rojo";
    }
    if(numero == 2 )
    {
      this.colorPedido="azul";
    }
    else
    {
      this.colorPedido="verde";
    }
  }

  Ingresar(color)
  { 
    this.Spinner();
    color == this.colorPedido ? this.ok=true : this.ok==false;

    this.httpCaptcha.EnviarCaptcha(this.ok)
    .subscribe((data)=>{
      this.spinner=false;

     this.respuesta= JSON.parse(data._body);
     this.lanzador.emit(this.respuesta);
     console.log(this.respuesta);
     
    
   })

   

  }
  ngOnInit() {
  }

}

  

