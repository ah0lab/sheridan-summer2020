import { Injectable } from "@angular/core";
import { City } from "./city.model";
import { Observable, from } from "rxjs";

@Injectable()
export class StaticDataSource
{
    private Cities : City[] = [
        new City ("Canada", "Toronto", "../assets/toronto.jpg"),
        new City ("United States", "New York", "../assets/newyork.jpg"),
        new City ("Ecuador", "Quito", "../assets/quito.jpg")
    ];

    getCities () : Observable<City[]> { return from([this.Cities]); }
}