import { Component, Input } from '@angular/core';
import { TissageService } from '../tissage.service';
import { ICarte } from '../interfaces/carte';
import { NgClass, NgStyle } from '@angular/common';

@Component({
  selector: 'app-motif',
  standalone: true,
  imports: [
    NgClass,
    NgStyle
  ],
  templateUrl: './motif.component.html',
  styleUrl: './motif.component.css'
})
export class MotifComponent {
  @Input() motif!: ICarte[][];

  constructor(
  ) {
  }
}
