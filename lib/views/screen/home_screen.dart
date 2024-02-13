import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipe/views/widget/recipe_cart.dart';
import 'package:food_recipe/views/widget/show_meal_info.dart';
import 'package:http/http.dart';

import '../../model/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Meal> mealList = [];

class _HomeState extends State<Home> {
  bool isLoding = false;

  @override
  void initState() {
    getData();
    super.initState();
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
              width: 5,
            ),
            Text('Meal'),
          ],
        ),
      ),
      body: Visibility(
        visible: isLoding == false,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: mealList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowMealInfo(
                      title: mealList[index].strCategory.toString(),
                      image: mealList[index].strCategoryThumb.toString(),
                      ditails:
                          mealList[index].strCategoryDescription.toString(),
                    ),
                  ),
                );
              },
              child: RecipeCart(
                title: mealList[index].strCategory,
                thumbnailUrl: mealList[index].strCategoryThumb,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> getData() async {
    isLoding = true;
    setState(() {});
    Uri url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php#');
    Response response = await get(url);
    if (response.statusCode == 200) {
      var deocdedBody = jsonDecode(response.body);
      var list = deocdedBody['categories'];
      for (var item in list) {
        Meal meal = Meal.fromJson(item);
        mealList.add(meal);
      }
      isLoding = false;
      setState(() {});
    }
    setState(() {});
  }
}
