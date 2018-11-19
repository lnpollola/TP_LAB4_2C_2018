import { Component, OnInit, Input } from '@angular/core';
import { MesasService } from '../services/mesas.service';
import { AuthService } from '../services/auth/auth.service';


@Component({
  selector: 'app-mesas',
  templateUrl: './mesas.component.html',
  styleUrls: ['./mesas.component.css']
})
export class MesasComponent implements OnInit {

  listaMesas;
  importe;
  display: boolean = false;
  perfil;

  constructor(private httpMesa: MesasService, private auth: AuthService) {

    // this.perfil=this.auth.GetPayLoad().perfil;
    this.TraerLasMesas();
   }

 

  TraerLasMesas()
  {
    this.httpMesa.TraerMesas().subscribe(data=>{
      this.listaMesas= JSON.parse(data._body);
      console.log(this.listaMesas);
  })
  }

  ServirMesa(idMesa)
  {
    this.httpMesa.ServirMesa(idMesa)
    .subscribe((data)=>{
      console.log(data);
      this.TraerLasMesas();
    })
    ;
  }

  Cobrar(idMesa)
  {
    this.httpMesa.CobrarMesa(idMesa)
    .subscribe((data)=>{
      console.log(data);
      this.importe= JSON.parse(data._body).total;
      this.display=true;
      this.TraerLasMesas();
    });
  }

  Cerrar(idMesa)
  {
    this.httpMesa.CerrarMesa(idMesa)
    .subscribe((data)=>{
      console.log(data);

      this.TraerLasMesas();
    });
  }


  ngOnInit() {
  }

}
