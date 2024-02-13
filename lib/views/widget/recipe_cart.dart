import 'package:flutter/material.dart';

class RecipeCart extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;

  const RecipeCart(
      {super.key,
      required this.title,
      required this.rating,
      required this.cookTime,
      required this.thumbnailUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      height: 180,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(0, 10),
            blurRadius: 10,
            spreadRadius: -6,
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
            thumbnailUrl,
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 19,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(rating),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(cookTime),
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}
