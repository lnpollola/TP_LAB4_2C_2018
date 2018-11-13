import { Injectable } from '@angular/core';
import { GenericoService} from '../services/generico.service';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class LoginService {

  constructor(public _generico: GenericoService) { }

  public ServiceLogin(datosLogin):Observable<any> {
    //console.log("entro LoginService" + datosLogin);
    
    return this._generico.httpPost("Sesion/",datosLogin)
        .pipe(data =>{return data;}); 

  }



}
