import { Injectable } from '@angular/core';
import { GenericoService } from './generico.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductosService {

  constructor(private http: GenericoService) { }

  TraerProductos():Observable<any>{
    return this.http.httpGet("Productos/TraerTodos")
    .pipe(data=>{return data});
    
  }
}


