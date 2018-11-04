import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { Validators, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { RegistroService } from '../../servicios/registro.service';
import { Usuario } from '../../clases/usuario';
import { ReactiveFormsModule } from '@angular/forms';




function copiaClave(input: FormControl) {

      if (input.root.get('clave') == null) {
        
        return null;
      }

      const verificar = input.root.get('clave').value === input.value;
      return verificar ? null : { mismaClave : true };
  }

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})

export class RegistroComponent implements OnInit {

  email:FormControl;
  clave:FormControl;
  copiaClave: FormControl;
  registroForm: FormGroup;

  constructor(private builder: FormBuilder,
              private _registro: RegistroService
    ) {
      
    


     }


  ngOnInit() {
    this.email = new FormControl('', [
      Validators.required,
      Validators.minLength(5),
      Validators.email
    ]);
    
    this.clave = new FormControl('', [
      Validators.required,
     Validators.minLength(4)
    ]);
    
    this.copiaClave = new FormControl('', [
      Validators.required,
      copiaClave
    ]);
  
   
  
    this.registroForm = this.builder.group({
      email: this.email,
      clave: this.clave,
      copiaClave: this.copiaClave,
      
    });
    

  }

  onSubmit(){
    
    var usuario = new Usuario(this.registroForm.get('email').value, this.registroForm.get('clave').value);
    

    this._registro.Registro(usuario)
    //.subscribe(data =>{})
    ;

    alert("Usuario Registrado");
    console.log(this.registroForm.get('email').value); 
  }

  
  
 
  

}
