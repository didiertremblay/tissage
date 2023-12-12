import { Component, Input } from '@angular/core';
import { TissageService } from '../tissage.service';
import { ICarte } from '../interfaces/carte';
import { NgClass, NgStyle } from '@angular/common';

@Component({
  selector: 'app-motifsvg',
  standalone: true,
  imports: [
    NgClass,
    NgStyle,
  ],
  templateUrl: './motifsvg.component.html',
  styleUrl: './motifsvg.component.css'
})
export class MotifsvgComponent {
  @Input() motif!: ICarte[][];

  constructor(
  ) {
  }
}
