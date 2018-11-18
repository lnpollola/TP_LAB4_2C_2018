import { Producto } from "./producto";

export class Pedido {
    id:number;
    idMesa:number;
    tiempoInicio:string;
    fotoMesa:string;
    detalle:Array<Producto>;
}
