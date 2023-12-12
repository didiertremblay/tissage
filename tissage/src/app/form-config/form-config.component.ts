import { Component } from '@angular/core';
import { TissageService } from '../tissage.service';
import { IConfig } from '../interfaces/carte';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-form-config',
  standalone: true,
  imports: [
    FormsModule
  ],
  templateUrl: './form-config.component.html',
  styleUrl: './form-config.component.css'
})
export class FormConfigComponent {

  config!: IConfig;

  constructor(
    private tissageService: TissageService,
  ) {
    this.tissageService.getObservableConfig().subscribe(
      {
        next: (config: IConfig) => {
          this.config = config;
        }
      }
    );
  }


}
