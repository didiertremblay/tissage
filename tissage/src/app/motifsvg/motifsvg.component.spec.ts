import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MotifsvgComponent } from './motifsvg.component';

describe('MotifsvgComponent', () => {
  let component: MotifsvgComponent;
  let fixture: ComponentFixture<MotifsvgComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MotifsvgComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(MotifsvgComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
