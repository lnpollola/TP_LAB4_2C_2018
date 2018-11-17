import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef} from '@angular/material';
import { LoginComponent } from '../login/login.component';
import { Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  @Input() usuario: any;
  @Input() perfil: any;
  @Output() emiterHeader:EventEmitter<any> = new EventEmitter();
  
  perfilUsuario:boolean;
  nombre:string;

  constructor(private dialog: MatDialog) { }

  ngOnInit() {

    // console.log(localStorage.getItem('usuario'));
    if(localStorage.getItem('usuario') == null )
    {
      console.log("no hay usuario");
      this.perfilUsuario=false;
      this.nombre='';
    }
    else 
    {
      this.usuario = JSON.parse(localStorage.getItem('usuario')) ;
      this.nombre =this.usuario.nombre;
      this.perfilUsuario=true;
    }

    
    
  }

  openLoginForm(){
    this.dialog.open(LoginComponent, {width:'300px', height:'550px'});
    
    this.dialog.afterAllClosed.subscribe(result => {
      this.emiterHeader.emit();
    });

  }



}
