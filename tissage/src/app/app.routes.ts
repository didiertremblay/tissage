import { Routes } from '@angular/router';

export const routes: Routes = [
    {
        path: 'carte/:mode',
        loadComponent: () => import('./carte/carte.component').then(m => m.CarteComponent)

    },
    {
        path: '',
        redirectTo: '/carte/svg',
        pathMatch: 'full'
    }
];
