import 'package:flutter/cupertino.dart';
import 'package:food_delivery_application/constant.dart';

class Category extends StatelessWidget {
  //const Category({Key? key}) : super(key: key);

  final String image;
  final String title;
  Category(this.image, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: yellowColor, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            height: 40,
            fit: BoxFit.fitHeight,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
