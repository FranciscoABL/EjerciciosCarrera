import { Component, OnInit } from '@angular/core';
import {ActivatedRoute,Router} from '@angular/router';
import { Place } from '../place.module';
import { PlacesService } from '../places.service';
import { AlertController } from '@ionic/angular';
@Component({
  selector: 'app-place-detail',
  templateUrl: './place-detail.page.html',
  styleUrls: ['./place-detail.page.scss'],
})
export class PlaceDetailPage implements OnInit {
place:Place
  constructor(private activatedRoute:ActivatedRoute,private placesService:PlacesService
    ,private router:Router,private alert:AlertController) { }

  ngOnInit() {
    this.activatedRoute.paramMap.subscribe(paramap=>{
      const recipeId=paramap.get('placeId')
      this.place = this.placesService.getPlaceById(recipeId)
      console.log(this.place)
    })
  }

  async deletePlace(){
   const alertElement = await this.alert.create({
      header:'Estas seguro?',
      message:'Seguro con cuidado',
      buttons:[{
        text:'Cancel',
        role:'cancel'
      },
      {
        text:'Eliminar', 
        handler: ()=>{
        this.placesService.deletePlace(this.place.id)
        this.router.navigate(['/places'])
       }
      }
    ]
    });
   await alertElement.present();
    
  }

}
