import { NgClass, NgStyle } from '@angular/common';
import { Component } from '@angular/core';
import { TissageService } from '../tissage.service';
import { ICarte } from '../interfaces/carte';
import { MotifComponent } from '../motif/motif.component';
import { MotifcdkComponent } from '../motifcdk/motifcdk.component';
import { MotifsvgComponent } from '../motifsvg/motifsvg.component';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { MotiffontComponent } from '../motiffont/motiffont.component';

@Component({
  selector: 'app-carte',
  standalone: true,
  imports: [
    NgClass,
    NgStyle,
    MotifComponent,
    MotifcdkComponent,
    MotiffontComponent,
    MotifsvgComponent
  ],
  templateUrl: './carte.component.html',
  styleUrl: './carte.component.css'
})
export class CarteComponent {
  motif!: ICarte[][];
  legende!: string[];
  nbRangs!: number;
  mySubscription: Subscription[] = [];
  mode = 'css';

  constructor(
    private tissageService: TissageService,
    private router: Router,
    private route: ActivatedRoute
  ) {

    this.mySubscription.push(this.route.params.subscribe(
      {
        next: params => {
          this.mode = params['mode'];
        }
      }));

      this.mySubscription.push(this.tissageService.getObservableMotif().subscribe(
      {
        next: motif => {
          this.motif = motif;
          this.legende = this.tissageService.getLegende();
          this.nbRangs = this.tissageService.getNbRangs();
        }
      }));
  }

}
