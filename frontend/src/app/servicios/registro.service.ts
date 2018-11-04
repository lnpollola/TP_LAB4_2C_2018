import { Injectable } from '@angular/core';
import { GenericoService } from '../servicios/generico.service';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class RegistroService {

  constructor(private _generico: GenericoService) { }


  
    //public Registro(datos):Observable<any> {
      
    public Registro(datos){
      console.log("entro Registro" + datos.email);
      
      /*
      //CAMBIAR
      return this._generico.httpPost("validarusuario",datos)
          .pipe(data =>{return data;}); 
      */
    }
    
    
  
  




}
