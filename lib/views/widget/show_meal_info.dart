import 'package:flutter/material.dart';

class ShowMealInfo extends StatelessWidget {
  String title;
  String image;
  String ditails;

  ShowMealInfo(
      {required this.title, required this.image, required this.ditails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(image ?? ""),
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10,),
            Text('Ditails',style: TextStyle(color: Colors.black,fontSize: 20),),
            SizedBox(height: 10,),
            Text(ditails ?? "",style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
