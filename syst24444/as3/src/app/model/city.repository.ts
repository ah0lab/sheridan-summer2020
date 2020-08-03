import { Injectable } from "@angular/core";
import { City } from "./city.model";
import { StaticDataSource } from "./static.datasource";

@Injectable ()
export class CityRepository 
{
    private cities: City[] = [];

    constructor (private dataSource:StaticDataSource)
    {
        dataSource.getCities().subscribe (data => 
        {
            this.cities = data;
        });
    }

    getCities (): City[] { return this.cities; }

}