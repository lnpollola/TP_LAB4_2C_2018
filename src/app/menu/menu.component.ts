import { Component, OnInit } from '@angular/core';
import { Producto } from '../clases/producto';
import { ProductosService } from '../services/productos.service';
import { FormBuilder, FormControl } from '@angular/forms';
import { filter } from 'rxjs/operators';
import { PedidoService } from '../services/pedido.service';
import { Pedido } from '../clases/pedido';

export interface DetalleProductos {
  nombProducto: string;
  precio: string;
  accionesSusp: any;
}


@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})

export class MenuComponent implements OnInit {

  displayedColumns: string[] = ['nombProducto', 'precio', 'accionesSusp'];

  listaProductos:Array<Producto>;
  productosPedido:Array<Producto>;
  totalPedido:number=0;
  mesa:number;
  elPedido:Pedido;
  busqueda:string;
  respuestaAsync: any;


  // constructor(private dishServices:DishService) { }
  constructor(
    private httpProd: ProductosService, 
    private httpPedido: PedidoService
            ) { 

    this.elPedido=new Pedido();
    this.TraerProductos();
    
  }

  

  TraerProductos()
  {
    this.httpProd.TraerProductos().subscribe(data=>{
      this.listaProductos= JSON.parse(data._body);
    //  console.log(this.listaProductos);
      
   });
  }

  AgregarAlPedido(producto:Producto)
  {
    this.productosPedido ? this.productosPedido.push(producto) : this.productosPedido= new Array<Producto>(producto);
    
   this.totalPedido = this.totalPedido + producto.precio;
  // console.log(this.totalPedido);
    
  }

  QuitarAlPedido(producto:Producto){
  
    for(let i = 0; i < this.productosPedido.length; i++)
    {
      
      if(this.productosPedido[i].nombre == producto.nombre)
      {
        this.totalPedido-= producto.precio;
      //  console.log("se va a borrar el producto " + this.productosPedido[i].nombre);
        this.productosPedido.splice(i,1);
        break;
      }
    }

  }

IngresarPedido()
{
  this.elPedido.detalle= this.productosPedido;
  this.elPedido.idMesa=this.mesa;
  

  this.httpPedido.IngresarPedido(this.elPedido)
  .subscribe(
      
    (data)=>{
   let res=JSON.parse(data._body);
    this.elPedido.id= res.idPedido;
   // console.log(this.elPedido);
  })

}

async IngresarPedidoPromise()
{
  this.elPedido.detalle= this.productosPedido;
  this.elPedido.idMesa=this.mesa;
  

 await this.httpPedido.IngresarPedido(this.elPedido)
  .toPromise().then(
      
    (data)=>{
   this.respuestaAsync =JSON.parse(data._body);
    // this.elPedido.id= res.idPedido;
   // console.log(this.elPedido);
  })

  this.elPedido.id= this.respuestaAsync.idPedido;

}

  ngOnInit() {
    // this.dishServices.getDishes()
    // .subscribe(dishes => this.dishes = dishes);
  }

  // onSelect(dish: Dish){
  //   this.selectedDish = dish;
  // }

}
