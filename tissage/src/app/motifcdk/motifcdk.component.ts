import { Component, Input } from '@angular/core';
import { TissageService } from '../tissage.service';
import { ICarte } from '../interfaces/carte';
import { NgClass, NgStyle } from '@angular/common';
import {MatGridListModule} from '@angular/material/grid-list';

@Component({
  selector: 'app-motifcdk',
  standalone: true,
  imports: [
    NgClass,
    NgStyle,
    MatGridListModule
  ],
  templateUrl: './motifcdk.component.html',
  styleUrl: './motifcdk.component.css'
})
export class MotifcdkComponent {
  @Input() motif!: ICarte[][];

  constructor(
  ) {
  }
}
