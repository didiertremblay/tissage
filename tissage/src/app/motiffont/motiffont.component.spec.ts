import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MotiffontComponent } from './motiffont.component';

describe('MotiffontComponent', () => {
  let component: MotiffontComponent;
  let fixture: ComponentFixture<MotiffontComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MotiffontComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(MotiffontComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
