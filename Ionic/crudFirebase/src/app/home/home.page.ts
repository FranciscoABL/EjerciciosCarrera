import { Component, OnInit } from '@angular/core';
import { AlertController, NavController } from '@ionic/angular';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit{
  task:string
  taskList=[]
  constructor(private navctrl:NavController,private alertctrl:AlertController) {}
  ngOnInit(): void {
    this.getAllTask()
  }

  agregarTask(taskName){
    if (taskName.value.length>0){
      this.taskList.push({
        title:taskName.value,
        id: this.taskList.length +1 +""
      });
      taskName.value="";
    }
  }
  deleteTask(i){
    this.taskList.splice(i,1)
  }
  getAllTask(){
    return [...this.taskList]
  }
 async updateTask(index){
    let alert= await this.alertctrl.create({
      header:'Actualizar tarea?',
      message:'Escribe la nueva tarea',
      inputs:[{
        name:'Editar',placeholder:'Tarea'
      }],
      buttons:[{text:'Cancelar',role:'cancel'},{text:'Actualizar',
        handler:data=>{
          this.taskList[index]=data.Editar;
        }
      }]
    });
   await alert.present();
  }
}
