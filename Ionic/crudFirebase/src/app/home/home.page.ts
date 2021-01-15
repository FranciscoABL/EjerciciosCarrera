import { Component, OnInit } from '@angular/core';
import { AlertController, NavController, ViewWillEnter } from '@ionic/angular';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit,ViewWillEnter{
  task:string
  taskList=[]
  constructor(private navctrl:NavController,private alertctrl:AlertController) {}
  ionViewWillEnter(): void {
    this.taskList=this.getAllTask()
  }
  ngOnInit(): void {
    this.taskList=this.getAllTask()
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
  async deleteTask(i){
    let alert= await this.alertctrl.create({
      header:'Seguro?',
      message:'Esto borrara la tarea',
      buttons:[{
        text:'Cancelar',
        role:'cancel'
      },{
        text:'Eliminar',
        handler:()=>{
          this.taskList.splice(i,1)
        }
      }]
    });
    await alert.present();
  }
  getAllTask(){
    return [...this.taskList]
  }
 async updateTask(i){
    let alert= await this.alertctrl.create({
      header:'Actualizar tarea?',
      message:'Escribe la nueva tarea',
      inputs:[{
        name:'editar',type:'text',placeholder:'Tarea'
      }],
      buttons:[{text:'Cancelar',role:'cancel'},{text:'Actualizar',
        handler:data=>{
          this.taskList[i]=data.editar;
          console.log(data.editar);
        }
      }]
    });
   await alert.present();
  }
}
