import { Component, OnInit } from '@angular/core';
import { Usuario } from '../clases/usuario';
import { UsuariosService } from "../services/usuarios.service";
import { FormBuilder, FormControl, Validators, FormGroup } from '@angular/forms';
import { MessageService } from 'primeng/api';
import {Message} from 'primeng/components/common/api';



@Component({
  selector: 'app-usuarios',
  templateUrl: './usuarios.component.html',
  styleUrls: ['./usuarios.component.css']
})
export class UsuariosComponent implements OnInit {

captcha=false;
  listaUsuarios:Array<Usuario>;
  msgs: Message[] = [];

  constructor(private msjServ: MessageService, private builder: FormBuilder, private usrService: UsuariosService, private httpUsuarios:UsuariosService) {
    this.TraerTodosLosUsuarios();
   }

   email = new FormControl('', [
    Validators.required,
    Validators.minLength(5)
  ]);
  
  clave = new FormControl('', [
    Validators.required
  ]);

  perfil = new FormControl('', [
    Validators.required
  ]);
  

  sexo = new FormControl('', [
    Validators.required
  ]);

  registroForm: FormGroup = this.builder.group({
    email: this.email,
    clave: this.clave,
    sexo: this.sexo,
    perfil: this.perfil
   
  });


   TraerTodosLosUsuarios()
   {

   this.httpUsuarios.TraerUsuarios().subscribe(data=>{
    this.listaUsuarios= JSON.parse(data._body);
    console.log(this.listaUsuarios);
    
 });
   }


   IngresarUsuario()
   {
     if(this.captcha)
     {

      let usuario= this.registroForm.get('email').value;
      let clave= this.registroForm.get('clave').value;
      let perfil= this.registroForm.get('perfil').value;
      let sexo= this.registroForm.get('sexo').value;
  
       this.httpUsuarios.CargarUsuario(usuario, clave, sexo, perfil)
       .subscribe((data)=>{
         console.log(data);
         this.TraerTodosLosUsuarios();
       })
       ;
      

     }
     else{
       
    //  this.msjServ.add({severity: 'error', summary: 'Falta captcha', detail: ' este es el detalle'});
    this.msgs.push({severity:'error', summary:'Error', detail:'Falta validar el captcha'});
      
     }

    
   }

   

   RecibirCaptcha(ok)
   {
     console.log("recibido", ok);
    this.captcha=ok;
   }



  ngOnInit() {
  }

}
