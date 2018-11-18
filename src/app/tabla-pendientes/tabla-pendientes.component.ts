import { Component, OnInit } from '@angular/core';
import { PedidoService } from '../services/pedido.service';

export interface PeriodicElement {
  name: string;
  position: number;
  weight: number;
  symbol: string;
  preparacion:string;
  acciones:string;
}

// const ELEMENT_DATA: PeriodicElement[] = [
//   {position: 1, name: 'Hydrogen', weight: 1.0079, symbol: 'H'},
//   {position: 2, name: 'Helium', weight: 4.0026, symbol: 'He'},
//   {position: 3, name: 'Lithium', weight: 6.941, symbol: 'Li'},
//   {position: 4, name: 'Beryllium', weight: 9.0122, symbol: 'Be'},
//   {position: 5, name: 'Boron', weight: 10.811, symbol: 'B'},
//   {position: 6, name: 'Carbon', weight: 12.0107, symbol: 'C'},
//   {position: 7, name: 'Nitrogen', weight: 14.0067, symbol: 'N'},
//   {position: 8, name: 'Oxygen', weight: 15.9994, symbol: 'O'},
//   {position: 9, name: 'Fluorine', weight: 18.9984, symbol: 'F'},
//   {position: 10, name: 'Neon', weight: 20.1797, symbol: 'Ne'},
// ];

@Component({
  selector: 'app-tabla-pendientes',
  templateUrl: './tabla-pendientes.component.html',
  styleUrls: ['./tabla-pendientes.component.css']
})


export class TablaPendientesComponent implements OnInit {
  spinner:boolean;
  listaPendientes: Array<any>;
  tiempoPreparacion:number;
  
  displayedColumns: string[] = ['position', 'name', 'weight', 'symbol', 'preparacion', 'acciones'];
  // dataSource = ELEMENT_DATA;


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
