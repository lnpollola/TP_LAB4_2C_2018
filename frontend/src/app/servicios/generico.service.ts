import { Injectable } from '@angular/core';

import {Http ,Response} from '@angular/http';
//import 'rxjs/add/operator/toPromise';

//import {Observable} from 'rxjs/Observable';
//import 'rxjs/add/operator/map';
//import 'rxjs/add/operator/catch';
import { catchError, map, tap } from 'rxjs/operators';




@Injectable({
  providedIn: 'root'
})
export class GenericoService {


  api="http://localhost/Programacion-3-2017/TP_ESTACIONAMIENTO_DV/";
  
  
  constructor() { }
  /*constructor(public http:Http) { }
  public httpGetPromise(url: string, objeto:any){


    return this.http
    .get(url)
    .toPromise()
    .then(this.extraerDatos)
    .catch(this.handleError);
  }

  public httpPost(metodo:string, objeto:any)
  {
    return this.http.post(this.api + metodo, objeto)
    .pipe(catchError(this.handleError));
  }


  private extraerDatos(resp:Response) {

      return resp.json() || {};

  }
  private handleError(error:Response | any) {

      return error;
  }
  */














}
