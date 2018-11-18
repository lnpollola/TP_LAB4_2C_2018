import { Directive, ElementRef, Renderer, Input } from '@angular/core';

@Directive({
  selector: '[fondoEstado]'
})
export class EstadoPedidoDirective {
  @Input() estado: string;

  constructor(private element : ElementRef, private renderer : Renderer) { }
  ngOnInit()
  {
    if(this.estado=="en preparacion") {
      this.renderer.setElementStyle( this.element.nativeElement, "color", "green");
       
    
  
    }

  }



 

}
