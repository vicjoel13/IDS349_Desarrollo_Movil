import 'ingredient.dart';

class Recipes {

  String label;
  String imageURL;
  int servings;
  List<Ingredient> ingredients;

  Recipes(this.label, this.imageURL, this.servings, this.ingredients);

  static List<Recipes> samples = [
    Recipes(
      'Spaghetti and Meatballs',
      'assets/spagueti.jpg',
      4,
        [
          Ingredient(1, 'box', 'Spaghetti'),
          Ingredient(4, '', 'Frozen Meatballs'),
          Ingredient(0.5, 'jar', 'sauce')
        ]
    ),
    Recipes(
        'Tomato Soup',
        'assets/tomota_soup.jpg',
        2,
        [
          Ingredient(1, 'can', 'Tomato Soup')
        ]
    ),
    Recipes(
        'Grilled Cheese',
        'assets/grilled_cheese.jpg',
        1,
        [
          Ingredient(2, 'slices', 'Cheese'),
          Ingredient(2, 'slices', 'Bread')
      ]
    )
  ];
}