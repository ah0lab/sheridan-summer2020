import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { WeatherforumComponent } from './weatherforum.component';

describe('WeatherforumComponent', () => {
  let component: WeatherforumComponent;
  let fixture: ComponentFixture<WeatherforumComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ WeatherforumComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(WeatherforumComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
