import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodiegala/components/main_button.dart';
import 'package:foodiegala/models/orderable.dart';
import 'package:foodiegala/src/orders.dart';
import 'package:foodiegala/utils/utilities.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Order> existing = []; // List of existing orders
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Orders');

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
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage("assets/mainImages/chokas.png"),
                  ),
                  // Top Action Bar
                  Positioned(
                    top: 10,
                    child: Container(
                      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: SizedBox(
                        height: 50,
                        width: 340,
                        child: Row(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.details,
                                color: Colors.white,
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                  ),
                  // Product Info Card
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 250, left: 20, right: 20),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 173, 165, 165),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color(0xff2B2A60),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              height: 89.5,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Udan Miso",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "16:Rs",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Product Description
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 7),
                              child: Column(
                                children: [
                                  Text(
                                    "Our Udon Miso is a comforting bowl of thick, handmade udon noodles in a rich miso broth, garnished with tofu, spring onions, and vegetables.",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
              ),
              // Noodle Type
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Noodle Type",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 150,
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: ListView.builder(
                      itemBuilder: _buildCardforNoodleType,
                      itemCount: 9,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Add to Basket Button
                  MostButton(
                    text: "Add to Basket",
                    onTap: () {
                      onSave(context, existing);
                      // Save the order
                      String id =
                          DateTime.now().millisecondsSinceEpoch.toString();
                      databaseRef.child(id).set({
                        'title': "Udan Miso",
                        'id': DateTime.now().millisecondsSinceEpoch.toString()
                      }).then((value) {
                        Utils().toastedMessage('Post added');
                        setState(() {
                          loading = false;
                        });
                      }).onError((error, stackTrace) {
                        Utils().toastedMessage(error.toString());
                        setState(() {
                          loading = false;
                        });
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to add order and navigate to OrderPage
  void onSave(BuildContext context, List<Order> existingList) {
    // Create new order
    var data = Order(
      Image(
        image: AssetImage("assets/mainImages/chokas.png"),
      ),
      "Udon Miso",
      16, // Price
      "Delicious", // Subtitle
    );
    // Add order to the list
    existingList.add(data);
    // Navigate to OrderPage with the updated list
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(data: existingList),
      ),
    );
  }

  // Function to build list of noodle types
  Widget _buildCardforNoodleType(BuildContext context, int index) {
    return Row(
      children: [
        Text(
          "Thin",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Spacer(),
        Checkbox(
            value: true,
            onChanged: (value) {
              setState(() {
                value = value;
              });
            })
      ],
    );
  }
}
