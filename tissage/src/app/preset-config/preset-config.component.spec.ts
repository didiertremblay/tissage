import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PresetConfigComponent } from './preset-config.component';

describe('PresetConfigComponent', () => {
  let component: PresetConfigComponent;
  let fixture: ComponentFixture<PresetConfigComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PresetConfigComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(PresetConfigComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
