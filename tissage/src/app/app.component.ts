import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, RouterOutlet } from '@angular/router';
import { PresetConfigComponent } from './preset-config/preset-config.component';
import { FormConfigComponent } from './form-config/form-config.component';
import { CouleursComponent } from './couleurs/couleurs.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [
    CommonModule, 
    RouterOutlet,
    FormConfigComponent,
    CouleursComponent,
    PresetConfigComponent
  ],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  constructor(
    private router: Router,
  ) {}

  setMode(mode: string) {
    //this.mode= mode;
    this.router.navigate(['/carte', mode]);
  }

}
