import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MotifflexComponent } from './motifflex.component';

describe('MotifflexComponent', () => {
  let component: MotifflexComponent;
  let fixture: ComponentFixture<MotifflexComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MotifflexComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(MotifflexComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
