import { Component } from '@angular/core';

import { Platform } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { AngularFireModule } from 'angularfire2';
import { AngularFireAuth, AngularFireAuthModule } from 'angularfire2/auth';
import { AngularFirestore, AngularFirestoreModule } from 'angularfire2/firestore';
import { Router, RouterModule } from '@angular/router';
import { HomePage } from './home/home.page';
import { LoginPage } from './login/login.page';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss']
})
export class AppComponent {
  
  constructor(
    private platform: Platform,
    private splashScreen: SplashScreen,
    private statusBar: StatusBar,
    private afAuth:AngularFireAuth,
    private rootPage:RouterModule,

  ) {
    this.initializeApp();
    const authObserver = afAuth.authState.subscribe(user => {
      if (user) {
          this.rootPage=HomePage;
          authObserver.unsubscribe();
      } else {
          this.rootPage = LoginPage;
          authObserver.unsubscribe();
      }
  });
  }

  initializeApp() {
    this.platform.ready().then(() => {
      this.statusBar.styleDefault();
      this.splashScreen.hide();
    });
  }
}
