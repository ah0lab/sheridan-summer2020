import { Component, OnInit, Input } from '@angular/core';
import { Product } from '../model/product.model';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {
  @Input() products : Product[];

  constructor() { }

  ngOnInit(): void {
  }

}
