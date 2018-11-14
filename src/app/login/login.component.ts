import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { Validators, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import {Subscription} from "rxjs";
import {TimerObservable} from "rxjs/observable/TimerObservable";
import {LoginService} from '../../../src/app/services/login.service';
import {Usuario} from '../clases/usuario';
import { MatDialog, MatDialogRef} from '@angular/material';
import { delay } from 'rxjs/operators';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginForm: FormGroup;
    loading = false;
    submitted = false;
    returnUrl: string;
    datacallback: string;
    public dataRespuesta:any;

    constructor(
        private formBuilder: FormBuilder,
        //private route: ActivatedRoute,
        private router: Router,
        private _login: LoginService,
        private dialog: MatDialog
        //private authenticationService: AuthenticationService,
        //private alertService: AlertService
        ) {}

    ngOnInit() {
        this.loginForm = this.formBuilder.group({
            username: ['', Validators.required],
            password: ['', Validators.required]
        });
      }

      get f() { return this.loginForm.controls; }


  seteoLocalStorage()
  {
    
    // console.log( JSON.parse(localStorage.getItem('data')) );

    do 
    {
        localStorage.setItem('token',  localStorage.data.token  );
        // localStorage.setItem('usuario',  JSON.stringify(JSON.parse(localStorage.getItem('data')).datos)  ) ;    
    }while ( localStorage.getItem('data') === undefined)

 }

  Entrar(){ 
    
      this.submitted = true;
      this.loading = true;
      
      // stop here if form is invalid
      if (this.loginForm.invalid) {
          return;
      }
     
      let datosLogin = new Usuario(this.f.username.value, this.f.password.value);

      this._login.ServiceLogin(datosLogin).subscribe( data =>{
  
        // delay(2000);
        var respuesta = JSON.parse(data._body);
        console.log(respuesta);
        localStorage.setItem('data', JSON.stringify(respuesta) );
      
        // console.log( JSON.parse(this.dataRespuesta._body).token  );
          this.dialog.closeAll();
          this.router.navigate(['menu']); 
         
      });
    //   delay(2000);
    //   this.seteoLocalStorage();
  }

  
  

}
