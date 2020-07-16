import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-content',
  templateUrl: './content.component.html',
  styleUrls: ['./content.component.css']
})
export class ContentComponent implements OnInit {

  public name : string = "Ben";
  public campus : string = "Davis";
  public number : string = "99967231";
  public username : string = "neB";
  constructor() { }

  ngOnInit(): void {
  }

}
