import { Injectable } from "@angular/core";

@Injectable ()
export class Slide
{
    constructor (title:String, desc:String, imgSrc:String) 
    {
        this.slideTitle = title;
        this.slideDesc = desc;
        this.slideImage = imgSrc;
    }

    private slideImage : String;
    private slideTitle : String;
    private slideDesc : String;

    public setSlideImage (src:String)   { this.slideImage = src; }
    public setSlideTitle (title:String) { this.slideTitle = title; }
    public setSlideDesc  (desc:String)  { this.slideDesc = desc; }
    
    public getSlideImage () : String { return this.slideImage; }
    public getSlideTitle () : String { return this.slideTitle; }
    public getSlideDesc  () : String { return this.slideDesc;}
}