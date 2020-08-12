import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-weather',
  templateUrl: './weather.component.html',
  styleUrls: ['./weather.component.css']
})
export class WeatherComponent implements OnInit {

  constructor(private http: HttpClient) { }

  public apiKey : string = "dd76821cd1852f61fc0ecbf17b3dca50";
  public city : FormControl = new FormControl ('');

  public temp : number = 0;
  public lat : number = 0;
  public long : number = 0;

  public retrieveData() 
  {
    let obs = 
      this.http.get<any> (`http://api.openweathermap.org/data/2.5/weather?q=${this.city.value}&appid=${this.apiKey}`);

    obs.subscribe ((response) => {
      console.log (response);
      this.long = response.coord.lon;
      this.lat  = response.coord.lat;
      this.temp = response.main.temp;
    });
  }

  ngOnInit(): void {
    this.city.setValue('Brampton');
  }

}
