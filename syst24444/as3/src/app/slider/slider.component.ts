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
  private currentIndex : number = 0;

  constructor(private repo:CityRepository) { }

  public getSlides ():Slide[] { return this.slides; }

  public next() : void 
  {
    if (this.currentIndex >= this.slides.length - 1) 
      this.currentIndex = 0;
    else 
      this.currentIndex++;
    return;
  }

  public previous() : void 
  {
    if (this.currentIndex <= 0)
      this.currentIndex = this.slides.length - 1;
    else 
      this.currentIndex--;
    return;
  }

  public getCurrentIndex (): number { return this.currentIndex; }

  public getSlideAt (index:number) : Slide 
  {
    if (index < 0 || index > this.slides.length)
      return null;
    return this.slides[index];
  }

  private loadSlides (): void 
  {
    this.repo.getCities ().forEach ( city => { 
      this.slides.push( new Slide (
        city.getCityName (),
        city.getCountryName (),
        city.getCityImage ()
      ));
    });
  }

  ngOnInit(): void {
    this.loadSlides ();
  }
}
