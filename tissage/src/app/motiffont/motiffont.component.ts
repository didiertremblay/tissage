import { Component, Input } from '@angular/core';
import { TissageService } from '../tissage.service';
import { ICarte } from '../interfaces/carte';
import { NgClass, NgStyle } from '@angular/common';

@Component({
  selector: 'app-motiffont',
  standalone: true,
  imports: [
    NgClass,
    NgStyle,
  ],
  templateUrl: './motiffont.component.html',
  styleUrl: './motiffont.component.css'
})
export class MotiffontComponent {
  @Input() motif!: ICarte[][];

  constructor(
  ) {
  }
}
