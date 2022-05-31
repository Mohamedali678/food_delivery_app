import 'package:flutter/material.dart';

import 'package:food_delivery_application/constant.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(42),
          topRight: Radius.circular(42),
        ),
      ),
      height: 60,
      child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: yellowColor,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  color: yellowColor,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_rounded,
                  color: yellowColor,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.blur_circular_outlined,
                  size: 30,
                  color: yellowColor,
                ),
                label: ""),
          ]),
    );
  }
}
