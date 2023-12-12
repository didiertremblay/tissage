import { Injectable } from '@angular/core';
import { ICarte, IConfig } from './interfaces/carte';
import { ReplaySubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TissageService {
  exemple = '%7B"B0"%3A"%233289c7"%2C"A7"%3A"%233289c7"%2C"B6"%3A"%233289c7"%2C"A5"%3A"%233289c7"%2C"B4"%3A"%233289c7"%2C"A3"%3A"%233289c7"%2C"B2"%3A"%233289c7"%2C"A1"%3A"%233289c7"%2C"A51"%3A"%233289c7"%2C"B50"%3A"%233289c7"%2C"A49"%3A"%233289c7"%2C"B48"%3A"%233289c7"%2C"A47"%3A"%233289c7"%2C"B46"%3A"%233289c7"%2C"A45"%3A"%233289c7"%2C"B44"%3A"%233289c7"%2C"B43"%3A"%233289c7"%2C"A44"%3A"%233289c7"%2C"B45"%3A"%233289c7"%2C"A46"%3A"%233289c7"%2C"B47"%3A"%233289c7"%2C"A48"%3A"%233289c7"%2C"B49"%3A"%233289c7"%2C"A50"%3A"%233289c7"%2C"A0"%3A"%233289c7"%2C"B7"%3A"%233289c7"%2C"A6"%3A"%233289c7"%2C"B5"%3A"%233289c7"%2C"A4"%3A"%233289c7"%2C"B3"%3A"%233289c7"%2C"A2"%3A"%233289c7"%2C"B1"%3A"%233289c7"%2C"B8"%3A"%23325c44"%2C"A11"%3A"%23325c44"%2C"B14"%3A"%23325c44"%2C"B9"%3A"%23325c44"%2C"A8"%3A"%23eddf1c"%2C"B11"%3A"%23eddf1c"%2C"A14"%3A"%23eddf1c"%2C"B10"%3A"%23eddf1c"%2C"A13"%3A"%23eddf1c"%2C"A9"%3A"%23381ced"%2C"A10"%3A"%23381ced"%2C"B12"%3A"%23381ced"%2C"B13"%3A"%23381ced"%2C"A12"%3A"%23325c44"%2C"A15"%3A"%23381ced"%2C"B16"%3A"%23b52d6a"%2C"A17"%3A"%23b52d6a"%2C"B18"%3A"%23b52d6a"%2C"A19"%3A"%23b52d6a"%2C"B15"%3A"%23b52d6a"%2C"A16"%3A"%23b52d6a"%2C"B17"%3A"%23b52d6a"%2C"A18"%3A"%23b52d6a"%2C"B19"%3A"%2375e6a6"%2C"A20"%3A"%2375e6a6"%2C"B21"%3A"%2375e6a6"%2C"A22"%3A"%2375e6a6"%2C"A28"%3A"%2375e6a6"%2C"B29"%3A"%2375e6a6"%2C"A30"%3A"%2375e6a6"%2C"B31"%3A"%2375e6a6"%2C"B20"%3A"%23325c44"%2C"A21"%3A"%23325c44"%2C"B22"%3A"%23325c44"%2C"A23"%3A"%23325c44"%2C"B28"%3A"%23325c44"%2C"A29"%3A"%23325c44"%2C"B30"%3A"%23325c44"%2C"A31"%3A"%23325c44"%2C"B37"%3A"%23381ced"%2C"A40"%3A"%23381ced"%2C"A37"%3A"%23325c44"%2C"B40"%3A"%23325c44"%2C"A43"%3A"%23325c44"%2C"A36"%3A"%23eddf1c"%2C"A38"%3A"%23325c44"%2C"B41"%3A"%23325c44"%2C"B39"%3A"%23eddf1c"%2C"A42"%3A"%23eddf1c"%2C"B38"%3A"%23eddf1c"%2C"A41"%3A"%23eddf1c"%2C"B36"%3A"%23381ced"%2C"A39"%3A"%23381ced"%2C"B42"%3A"%23381ced"%2C"A35"%3A"%23b52d6a"%2C"B34"%3A"%23b52d6a"%2C"A33"%3A"%23b52d6a"%2C"B32"%3A"%23b52d6a"%2C"A32"%3A"%23b52d6a"%2C"B33"%3A"%23b52d6a"%2C"A34"%3A"%23b52d6a"%2C"B35"%3A"%23b52d6a"%2C"B23"%3A"%23f7f7f7"%2C"B24"%3A"%23f7f7f7"%2C"B27"%3A"%23f7f7f7"%2C"A27"%3A"%23f7f7f7"%2C"B25"%3A"%23f7f7f7"%2C"A25"%3A"red"%2C"B26"%3A"red"%2C"A24"%3A"red"%2C"A26"%3A"red"%7D&name=Bande+de+Marie+Néron&patron_date=août+2010+Lac+St-Jean&patron_chaine=Orlec+2%2F8&patron_trame=Orlec+doublé+2%2F8+bleu+moyen&patron_fils_chaine=103&width=52&height=12&color%233289c7=&color%23325c44=&color%23381ced=&color%23eddf1c=&color%23b52d6a=&color%23f7f7f7=&colorred=&color%2375e6a6=&commentaires=largeur+tissée+1+6%2F8+pouce&name=test';

  private config!: IConfig;
  private motif: ICarte[][] = [];
  private config$ = new ReplaySubject<IConfig>();
  private motif$ = new ReplaySubject<any>();

  constructor() {
    this.loadDesign(this.exemple)
  }

  loadDesign(design: string) {
    // Parse the example
    // Decode url URLencoded data
    let rawData = decodeURIComponent(design);
    // Split with &
    let data = rawData.split("&");
    // The first element is a JSON object
    const rawMotif = JSON.parse(data[0]);
    // The rest are key=value
    const forConfig:any = {};

    let rest = data.slice(1);

    // Fix bug 1
    let rest2 = rest.map(
      (x) => {
        if (x.indexOf("color") === -1) return x;
        // There is a bug where we need to fix the color
        // Remove the last character
        return x;
      }
    );

    rest2.forEach(
      (x) => {
        if (x.indexOf("color") === -1) {
          let [key, value] = x.split("=");
          forConfig[key] = value;
        } else {
          x = x.slice(0, -1);
          // replace the string color by color=
          x = x.replace("color", "color=");
          let [key, value] = x.split("=");
          if (forConfig["colors"] === undefined) {
            forConfig["colors"] = [];
          }
          forConfig["colors"].push(value);
  
        }
      }
    );

    // Fix Type
    forConfig.width = parseInt(forConfig.width);
    forConfig.height = parseInt(forConfig.height);

    this.config$.next(forConfig);

    // Enable the motif for testing
    const motif: ICarte[][] = [
        this.getRow("A", forConfig.width, rawMotif),
        this.getRow("B", forConfig.width-1, rawMotif),
    ]

    // Fix a bug where every second row is switch between A and B
    for (let i = 0; i < motif[0].length-1; i++) {
      if (i % 2 === 0) {
        const tmp = motif[0][i];
        motif[0][i] = motif[1][i];
        motif[1][i] = tmp;
      }
    }

    this.motif$.next(motif);
    this.config = forConfig;
    this.motif = motif;

    console.log(motif);
    console.log(forConfig);
  }

  getRow(prefix: string, longueur: number, rawMotif: any) {
    return new Array(longueur).
      fill(0).
      map(
        (x, i) => {
          return {
            couleur: rawMotif[`${prefix}${i}`]
          }
        }
      );
  }

  getLegende() {
    return new Array(this.config.width).
      fill(0).
      map(
        (x, i) => { return i.toString() }
      );
  }

  getObservableConfig() {
    return this.config$.asObservable();
  }

  getObservableMotif() {
    return this.motif$.asObservable();
  }

  getMotif() {
    return this.motif;
  }

  getNbRangs() {
    return this.config.height;
  }
}
