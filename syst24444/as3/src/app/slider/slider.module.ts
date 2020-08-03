import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ModelModule } from '../model/model.module';
import { SliderComponent } from '../slider/slider.component';

@NgModule ({
    imports: [ModelModule, BrowserModule],
    declarations: [SliderComponent],
    exports: [SliderComponent]
})
export class SliderModule {};