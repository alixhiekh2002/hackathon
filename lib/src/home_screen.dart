// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:foodiegala/components/main_field.dart';
import 'package:foodiegala/models/deals_card.dart';
import 'package:foodiegala/models/vegs_card.dart';
import 'package:foodiegala/src/otherScreens/restaurant_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Deals> deals = [
    Deals("assets/images/Pasta.png", "30% OFF"),
    Deals("assets/images/Pasta.png", "30% OFF"),
    Deals("assets/images/Pasta.png", "30% OFF"),
    Deals("assets/images/Pasta.png", "30% OFF"),
    Deals("assets/images/Pasta.png", "30% OFF"),
  ];
  List<Vegs> vegs = [
    Vegs("assets/images/burger.png", "Burger"),
    Vegs("assets/images/sushi.png", "Sushi"),
    Vegs("assets/images/taco.png", "Taco"),
    Vegs("assets/images/cake.png", "Cake"),
    Vegs("assets/images/burger.png", "Burger"),
    Vegs("assets/images/sushi.png", "Sushi"),
    Vegs("assets/images/taco.png", "Taco"),
    Vegs("assets/images/cake.png", "Cake"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/mainImages/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 39,
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delievery",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "MapleWood Suites",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset("assets/icons/offo.png")
                    ],
                  ),
                ),
                MainField(
                  placeholder: "Your Order",
                  icon: Icon(Icons.search),
                  borderColor: Color.fromARGB(255, 112, 23, 185),
                ),
                SizedBox(
                  height: 17,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 20),
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, _) => const SizedBox(
                      width: 12,
                    ),
                    itemCount: vegs.length,
                    itemBuilder: _buildcardforCategory,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.zero,
                  height: 220,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, _) => const SizedBox(
                      width: 12,
                    ),
                    itemCount: deals.length,
                    itemBuilder: _buildCardforDeals,
                  ),
                ),
                Text(
                  "Fastest Near You",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RestaurantScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30, right: 20),
                    height: 280,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.deepPurple,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage("assets/images/restaurant.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildcardforCategory(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurple,
              ),
              color: Color(0xff1D102D),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Image(
              image: AssetImage(vegs[index].image),
            ),
          ),
          SizedBox(height: 8),
          Text(
            vegs[index].titleofProduct,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCardforDeals(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.only(left: 20, top: 50),
            width: 320,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurple,
              ),
              image: DecorationImage(
                alignment: Alignment.bottomRight,
                image: AssetImage(deals[index].image),
              ),
              color: Color(0xff1D102D),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      deals[index].dealPerson,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      "Discover Discounts in your\nfavourite local restaurant",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
