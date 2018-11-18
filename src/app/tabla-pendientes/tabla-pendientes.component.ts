import { Component, OnInit } from '@angular/core';
import { PedidoService } from '../services/pedido.service';

@Component({
  selector: 'app-tabla-pendientes',
  templateUrl: './tabla-pendientes.component.html',
  styleUrls: ['./tabla-pendientes.component.css']
})
export class TablaPendientesComponent implements OnInit {
  spinner:boolean;
  listaPendientes: Array<any>;
  tiempoPreparacion:number;
  constructor(private httpServicio: PedidoService) {

    this.TraerTabla();

   }

   TraerTabla()
   {
     this.spinner=true;
    this.httpServicio.TraerPedidosPorSector()
    
    .subscribe(data=>{
      this.listaPendientes= JSON.parse(data._body);
      this.spinner=false;
    })


   }
  ngOnInit() {
    this.TraerTabla();
  }

}
