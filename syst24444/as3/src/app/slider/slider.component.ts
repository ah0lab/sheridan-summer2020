import { Component, OnInit } from '@angular/core';
import { Slide } from '../model/slide.model';
import { CityRepository } from '../model/city.repository';

@Component({
  selector: 'app-slider',
  templateUrl: './slider.component.html',
  styleUrls: ['./slider.component.css']
})
export class SliderComponent implements OnInit{

  private slides : Slide[] = [];
  constructor(private repo:CityRepository) { }

  public getSlides ():Slide[] { return this.slides; }

  private loadSlides (): void 
  {
    this.repo.getCities ().forEach ( city => { 
      this.slides.push( new Slide (
        city.getCityName (),
        city.getCountryName (),
        city.getCityImage ()
      ));
      console.log (city.getCityName ());
      console.log (city.getCountryName ());
    });
  }

  ngOnInit(): void {
    this.loadSlides ();
  }
}
