import 'package:flutter/material.dart';
import 'package:food_recipe/views/widget/recipe_cart.dart';

import '../../model/recipe.dart';
import '../../model/recipe_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text('Food Recipe')
          ],
        ),
      ),
      body:_isLoading?Center(child: CircularProgressIndicator(),): ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          return RecipeCart(
            title: _recipes[index].name,
            cookTime: _recipes[index].totalTime,
            rating: _recipes[index].rating.toString(),
            thumbnailUrl:_recipes[index].images,);
        },
      ),
    );
  }
}
