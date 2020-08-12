export class Product {
  name: string;
  price: number;
  quantity: number;

  constructor (n:string, p:number, q:number) {
    this.name = n;
    this.price = p;
    this.quantity = q;
  }

  get Price() :number { return this.price;}
  get Name() :string {return this.name;}
  get Quantity() :number {return this.quantity;}
}