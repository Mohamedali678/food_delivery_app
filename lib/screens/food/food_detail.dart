import 'package:flutter/material.dart';
import 'package:food_delivery_application/constant.dart';
import 'package:food_delivery_application/screens/food/food_info.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodDetails extends StatelessWidget {
  final controller = PageController(viewportFraction: 8.2);

  final String imageUrl;
  final String name;
  final double rating;
  final double price;

  FoodDetails(this.imageUrl, this.name, this.rating, this.price, {Key? key})
      : super(key: key);

  int amount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF1E6),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            SizedBox(
              height: 240,
              child: PageView(
                //controller: controller,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.4),
                                  borderRadius: BorderRadius.circular(12)),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 30,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.4),
                                  borderRadius: BorderRadius.circular(12)),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border_outlined,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 80,
                        child: Image(
                          height: 200,
                          fit: BoxFit.cover,
                          image: AssetImage(imageUrl),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 6,
              effect: const WormEffect(
                  dotHeight: 18,
                  dotWidth: 16,
                  type: WormType.thin,
                  strokeWidth: 9,
                  dotColor: Colors.white,
                  activeDotColor: yellowColor,
                  radius: 8.0),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xffF2CF63),
                                size: 25,
                              ),
                              Text(
                                "${rating}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const Text(" (41 ratings)")
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ ${amount * price}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: yellowColor),
                          ),
                          Container(
                            width: 160,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFF1E5),
                              borderRadius: BorderRadius.circular(26),
                            ),
                            constraints:
                                BoxConstraints(maxHeight: 40, maxWidth: 180),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 36,
                                  backgroundColor: yellowColor,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      // size: 30,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${amount}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                CircleAvatar(
                                  radius: 36,
                                  backgroundColor: yellowColor,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      // size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          FoodInfo(
                            "Size",
                            "Medium",
                            Icons.keyboard_arrow_down_outlined,
                            Colors.orange,
                          ),
                          FoodInfo("Energy", "544 KCal",
                              Icons.arrow_drop_down_sharp, Colors.transparent),

                          FoodInfo("Delivery", "45 min",
                              Icons.arrow_drop_down_sharp, Colors.transparent),
                          // FoodInfo("Energy", "544 KCal", ""),
                          // FoodInfo("Delivery", "45 min", ""),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                      child: Text(
                        "Crispy seasoned chicken breast, topped with mandatory melted cheese and piled onto soft rolls with onion, avocado, lettuce, tomato and garlic mayo\n(if ordered).",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 22),
        child: MaterialButton(
          onPressed: () {},
          height: 62,
          minWidth: double.infinity,
          color: yellowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            "Add to CART",
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
