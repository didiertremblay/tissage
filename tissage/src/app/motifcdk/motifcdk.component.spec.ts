import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MotifcdkComponent } from './motifcdk.component';

describe('MotifcdkComponent', () => {
  let component: MotifcdkComponent;
  let fixture: ComponentFixture<MotifcdkComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MotifcdkComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(MotifcdkComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
