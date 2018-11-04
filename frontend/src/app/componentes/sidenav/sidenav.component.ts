import { Component, OnInit } from '@angular/core';
import {MatSidenavModule} from '@angular/material/sidenav';
import {MatButtonModule} from '@angular/material/button';

export interface Section {
  name: string;
  updated: Date;
}


@Component({
  selector: 'app-sidenav',
  templateUrl: './sidenav.component.html',
  styleUrls: ['./sidenav.component.css']
})
export class SidenavComponent implements OnInit {

   usuario: string;
   folders: Section [];
   notes: Section [];

  constructor() { }

  ngOnInit() {
  
    //this.usuario = localStorage.getItem('usuario');
    this.usuario = 'mozo';
    
    this.ItemsSideNav(this.usuario);

  }

  ItemsSideNav(tipo){
  
      switch (tipo) {
        case 'admin':
              this.folders = [
                {
                  name: 'Empleados',
                  updated: new Date('1/1/16'),
                },
                {
                  name: 'Clientes',
                  updated: new Date('1/17/16'),
                },
                {
                  name: 'Pedidos',
                  updated: new Date('1/28/16'),
                }
              ];
              this.notes = [
                {
                  name: 'PDF',
                  updated: new Date('2/20/16'),
                },
                {
                  name: 'Excel',
                  updated: new Date('1/18/16'),
                }
              ];  
        break;
        
        case 'mozo':
              this.folders = [
                {
                  name: 'Alta de Pedido',
                  updated: new Date('1/1/16'),
                },
                {
                  name: 'Pedidos Pendientes',
                  updated: new Date('1/17/16'),
                }
               
              ];
              this.notes = [
                {
                  name: 'PDF',
                  updated: new Date('2/20/16'),
                },
                {
                  name: 'Excel',
                  updated: new Date('1/18/16'),
                }
              ];  
        break;
        
      
      }
    
    }



}
