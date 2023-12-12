export interface ICarte {
    couleur: string;
  }

  /*
{
    "name": "test",
    "patron_date": "août+2010+Lac+St-Jean",
    "patron_chaine": "Orlec+2/8",
    "patron_trame": "Orlec+doublé+2/8+bleu+moyen",
    "patron_fils_chaine": "103",
    "width": "52",
    "height": "12",
    "colors": [
        "#3289c7",
        "#325c44",
        "#381ced",
        "#eddf1c",
        "#b52d6a",
        "#f7f7f7",
        "red",
        "#75e6a6"
    ],
    "commentaires": "largeur+tissée+1+6/8+pouce"
}
*/

export interface IConfig {
    name: string;
    patron_date: string;
    patron_chaine: string;
    patron_trame: string;
    patron_fils_chaine: string;
    width: number;
    height: number;
    colors: string[];
    commentaires: string;
  }


  /*
  [
    [
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#381ced"
        },
        {
            "couleur": "#eddf1c"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#381ced"
        },
        {
            "couleur": "#eddf1c"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#381ced"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#f7f7f7"
        },
        {
            "couleur": "red"
        },
        {
            "couleur": "red"
        },
        {
            "couleur": "#f7f7f7"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#381ced"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#eddf1c"
        },
        {
            "couleur": "#381ced"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#eddf1c"
        },
        {
            "couleur": "#381ced"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        }
    ],
    [
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#eddf1c"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#381ced"
        },
        {
            "couleur": "#eddf1c"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#381ced"
        },
        {
            "couleur": "#eddf1c"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#75e6a6"
        },
        {
            "couleur": "#75e6a6"
        },
        {
            "couleur": "#75e6a6"
        },
        {
            "couleur": "#75e6a6"
        },
        {
            "couleur": "#f7f7f7"
        },
        {
            "couleur": "red"
        },
        {
            "couleur": "#f7f7f7"
        },
        {
            "couleur": "red"
        },
        {
            "couleur": "#f7f7f7"
        },
        {
            "couleur": "#75e6a6"
        },
        {
            "couleur": "#75e6a6"
        },
        {
            "couleur": "#75e6a6"
        },
        {
            "couleur": "#75e6a6"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#b52d6a"
        },
        {
            "couleur": "#eddf1c"
        },
        {
            "couleur": "#381ced"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#eddf1c"
        },
        {
            "couleur": "#381ced"
        },
        {
            "couleur": "#325c44"
        },
        {
            "couleur": "#eddf1c"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        },
        {
            "couleur": "#3289c7"
        }
    ]
]
  */
