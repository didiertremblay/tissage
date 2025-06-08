import { Component, Input } from '@angular/core';
import { ICarte } from '../interfaces/carte';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-motifflex',
  standalone: true,
  imports: [
    CommonModule
  ],
  templateUrl: './motifflex.component.html',
  styleUrl: './motifflex.component.css'
})
export class MotifflexComponent {
  @Input() motif!: ICarte[][];

}
