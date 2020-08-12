import { Component, Input } from '@angular/core';
import { Product } from './model/product.model';
import { HttpClient } from '@angular/common/http'

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {
  title : string;
  products : Product[] = [];

  constructor (private http : HttpClient) { }

  public retrieveData () 
  {
    let obs = 
      this.http.get<any> ('aholab.dev.fast.sheridanc.on.ca/syst24444/finalexam/assets/data/data.json');

    obs.subscribe ((response) => {
      this.title = response.title;
      response.products.foreach((prod) => {
        this.products.push (new Product(
          prod.name,
          prod.price,
          prod.numberOfItems
        ));
      });
    });
  }
}
