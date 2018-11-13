import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef} from '@angular/material';
import { LoginComponent } from '../login/login.component';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  usuario: any;

  constructor(private dialog: MatDialog) { }

  ngOnInit() {
    // this.usuario = JSON.parse(localStorage.getItem('usuario'));


  }

  openLoginForm(){
    this.dialog.open(LoginComponent, {width:'300px', height:'550px'});
  }

}
