import { Directive, ElementRef, Renderer, Input } from '@angular/core';

@Directive({
  selector: '[fondoEstado]'
})
export class EstadoPedidoDirective {
  @Input() estado: string;

  constructor(private element : ElementRef, private renderer : Renderer) { }
  ngOnInit()
  {
    switch(this.estado)
    {
      
      case "pendiente": 
      this.renderer.setElementStyle( this.element.nativeElement, "color", "orangered");
      break;
      
      case "en preparacion": 
      this.renderer.setElementStyle( this.element.nativeElement, "color", "orange");
      break;
      
      case "listo para servir": 
      this.renderer.setElementStyle( this.element.nativeElement, "color", "greenyellow");
      break;
      
      
    }

  }



 

}
