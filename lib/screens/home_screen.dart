import 'package:flutter/material.dart';
import 'package:food_delivery_application/constant.dart';
import 'package:food_delivery_application/model/food.dart';
import 'package:food_delivery_application/screens/bottom_nav.dart';
import 'package:food_delivery_application/screens/categories.dart';
import 'package:food_delivery_application/screens/food/food_detail.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  //creating object of the food class to get the data.
  final food = Food();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: BottomNavBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Row(
                children: const [
                  Icon(
                    Icons.location_on,
                    size: 30,
                    color: yellowColor,
                  ),
                  Text(
                    "Nevada, US",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 36,
                    color: yellowColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Order Your Food\nFast and Free",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  Image(
                    image: AssetImage("assets/images/Flat.png"),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 35,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          hintText: "Search"),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: yellowColor, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.category_rounded,
                            color: yellowColor, size: 38)),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
              child: Text(
                "Categories",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.2),
              ),
            ),

            //this is categories part
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 50,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: yellowColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Category("assets/images/bugger.png", "Bugger")),
                  Category("assets/images/pizza.png", "Pizza"),
                  Category("assets/images/sandwich.png", "Sandwich"),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10.0),
                itemCount: food.gettingFood.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 24,
                              color: Color(0xffF2CF63),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              food.gettingFood[index].rating.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodDetails(
                                  food.gettingFood[index].imageUrl,
                                  food.gettingFood[index].title,
                                  food.gettingFood[index].rating,
                                  food.gettingFood[index].price,
                                ),
                              ),
                            );
                          },
                          child: Image(
                            height: 90,
                            fit: BoxFit.cover,
                            image: AssetImage(food.gettingFood[index].imageUrl),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.gettingFood[index].title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              food.gettingFood[index].desc,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$${food.gettingFood[index].price}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: yellowColor,
                                    fontWeight: FontWeight.w600)),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: yellowColor,
                                  borderRadius: BorderRadius.circular(42)),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
