import { Injectable } from '@angular/core';
import { GenericoService } from './generico.service';

@Injectable({
  providedIn: 'root'
})
export class CaptchaService {

  constructor(private http: GenericoService) { }

  EnviarCaptcha(obj){
    return this.http.httpPost("Captcha/", {"consulta": obj} )
    .pipe((data)=>{
      return data;
    })
  }
}
