import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:foodiegala/components/main_button.dart';
import 'package:foodiegala/models/orderable.dart';

class OrderPage extends StatefulWidget {
  final List<Order>? data; // Orders passed from MenuScreen
  const OrderPage({super.key, this.data});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

final ref = FirebaseDatabase.instance.ref('Orders');

class _OrderPageState extends State<OrderPage> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/mainImages/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    "Order Detail",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return _bottomSheet();
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.deepPurple),
                        color: Colors.transparent,
                      ),
                      child: const Text(
                        "Show Checkout",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: widget.data != null && widget.data!.isNotEmpty
                    ? FirebaseAnimatedList(
                        query: ref,
                        defaultChild: Text('Loading'),
                        itemBuilder: (context, snapshot, animtion, index) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.data!.length,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 135,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: widget.data![index].image,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, top: 17),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "RS:${widget.data![index].priceOfProduct.toString()}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          widget.data![index].titleofProduct
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          widget.data![index].subTitle
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            // Quantity controls
                                            Row(
                                              children: [
                                                // Decrease Quantity Button
                                                Container(
                                                  width: 20,
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 7.9,
                                                    right: 3,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(5),
                                                      bottomLeft:
                                                          Radius.circular(5),
                                                    ),
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (quantity >= 1) {
                                                          quantity--;
                                                        }
                                                      });
                                                    },
                                                    child: const Text(
                                                      "-",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                                // Display Quantity
                                                Container(
                                                  width: 20,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6,
                                                          right: 3,
                                                          top: 4.5,
                                                          bottom: 4.5),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.grey,
                                                  ),
                                                  child:
                                                      Text(quantity.toString()),
                                                ),
                                                // Increase Quantity Button
                                                Container(
                                                  width: 20,
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 3.6,
                                                    right: 3,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(5),
                                                      bottomRight:
                                                          Radius.circular(5),
                                                    ),
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        quantity++;
                                                      });
                                                    },
                                                    child: const Text(
                                                      "+",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 80,
                                            ),
                                            // Delete Item Icon
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  widget.data!.removeAt(index);
                                                });
                                                // ref.child().remove();
                                              },
                                              child: const Icon(
                                                Icons.delete_outline,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                    : const Center(
                        child: Text(
                          "There is no Order",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Bottom sheet displaying total price and checkout
  Widget _bottomSheet() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Color(0xff1D102D)),
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 22,
          ),
          const Text(
            "SubTotal             RS:540",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Deleivery             Rs:439",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 216, 206, 206)),
          ),
          const SizedBox(
            height: 63,
          ),
          MostButton(text: "CheckOut", onTap: () {})
        ],
      ),
    );
  }
}
