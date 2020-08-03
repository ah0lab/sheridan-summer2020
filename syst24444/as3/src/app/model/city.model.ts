export class City 
{
    private countryName : String;
    private cityName    : String;
    private cityImage   : String;

    constructor (countryName:String, cityName:String, cityImage:String) 
    {
        this.countryName = countryName;
        this.cityName = cityName;
        this.cityImage = cityImage;
    }

    public setCountryName   (name:String)   { this.countryName = name; }
    public setCityName      (name:String)   { this.cityName = name; }
    public setCityImage     (src:String)    { this.cityImage = src; }

    public getCountryName   () : String     { return this.countryName; }
    public getCityName      () : String     { return this.cityName; }
    public getCityImage     () : String     { return this.cityImage; }
}