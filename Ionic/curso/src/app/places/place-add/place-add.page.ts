import { Component, OnInit } from '@angular/core';
import { PlacesService } from '../places.service';

@Component({
  selector: 'app-place-add',
  templateUrl: './place-add.page.html',
  styleUrls: ['./place-add.page.scss'],
})
export class PlaceAddPage implements OnInit {

  constructor(private placeService:PlacesService) { }

  ngOnInit() {
  }
  savePlace(title,url){
    this.placeService.addPlace(title.value,url.value)
  }

}
