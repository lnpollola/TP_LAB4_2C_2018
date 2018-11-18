import { Directive, ElementRef, Renderer, Input } from '@angular/core';

@Directive({
  selector: '[estilo]'
})
export class TipoProductoDirective {

  @Input() tipo: string;

  constructor(private element : ElementRef, private renderer : Renderer) { }

  ngOnInit()
  {


    switch(this.tipo)
    {
      case "cocina": this.renderer.setElementStyle( this.element.nativeElement, 'color', 'red');
      break;
      case "barra": this.renderer.setElementStyle( this.element.nativeElement, 'color', 'blue');
      break;
      case "chopera": this.renderer.setElementStyle( this.element.nativeElement, 'color', 'orange');
      break;
      case "candy": this.renderer.setElementStyle( this.element.nativeElement, 'color', 'yellow');
      break;
    }
  }

}
