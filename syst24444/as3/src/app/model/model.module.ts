import { NgModule } from '@angular/core';
import { CityRepository } from './city.repository';
import { StaticDataSource } from './static.datasource';

@NgModule ({
    providers: [CityRepository, StaticDataSource]
})
export class ModelModule {}