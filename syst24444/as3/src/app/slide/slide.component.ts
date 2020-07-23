import { Component, OnInit } from '@angular/core';
import { Slide } from '../model/slide.model'

@Component({
  selector: 'app-slide',
  templateUrl: './slide.component.html',
  styleUrls: ['./slide.component.css']
})
export class SlideComponent implements OnInit {

  constructor (slide : Slide) { }

  ngOnInit (): void {
  }
}
