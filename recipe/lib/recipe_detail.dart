import 'package:flutter/material.dart';
import 'package:recipe/recipes.dart';

class RecipeDetailPage extends StatefulWidget {
  RecipeDetailPage({super.key, required this.recipe});

  Recipes recipe;
  
  @override
  State<StatefulWidget> createState() {
    return _RecipeDetailState();
  }

}


class _RecipeDetailState extends State<RecipeDetailPage> {

  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300.0,
            width: double.infinity,
            child: Image.asset(widget.recipe.imageURL),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            widget.recipe.label,
            style: const TextStyle(
              fontSize: 20.0,
              fontFamily: 'Palatino',
              fontWeight: FontWeight.w700
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (context, index) {
                    final ingredient = '${widget.recipe.ingredients[index].quantity * _sliderVal} ${widget.recipe.ingredients[index].name} ${widget.recipe.ingredients[index].container}';
                    return Text(ingredient);
                  },
              )
          ),
          Slider(
            min: 1,
              max: widget.recipe.servings.toDouble(),
              inactiveColor: Colors.grey,
              activeColor: Colors.green,
              divisions: widget.recipe.servings,
              label: '$_sliderVal servings',
              value: _sliderVal.toDouble(),
              onChanged: (value) {
                setState(() {
                  _sliderVal = value.round();
                });
              },
          ),
        ],
      ),
    );
  }

}