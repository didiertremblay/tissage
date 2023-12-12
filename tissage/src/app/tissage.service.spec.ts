import { TestBed } from '@angular/core/testing';

import { TissageService } from './tissage.service';

describe('TissageService', () => {
  let service: TissageService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TissageService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
